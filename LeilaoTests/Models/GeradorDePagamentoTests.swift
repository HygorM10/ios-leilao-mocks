//
//  GeradorDePagamentoTests.swift
//  LeilaoTests
//
//  Created by Hygor Martins on 09/04/22.
//  Copyright © 2022 Alura. All rights reserved.
//

import XCTest
import Cuckoo
@testable import Leilao

class GeradorDePagamentoTests: XCTestCase {
    
    var daoFalso:MockLeilaoDao!
    var avaliador:Avaliador!
    var pagamentos:MockRepositorioDePagamento!

    override func setUpWithError() throws {
        daoFalso = MockLeilaoDao().withEnabledSuperclassSpy()
        avaliador = Avaliador()
        pagamentos = MockRepositorioDePagamento().withEnabledSuperclassSpy()
    }

    override func tearDownWithError() throws {
       
    }

    func testDeveGerarPagamentoParaUmLeilaoEncerrado(){
        let playstation = CriadorDeLeilao().para(descricao: "Playstation")
            .lance(Usuario(nome: "Hygor"),  2000.0)
            .lance(Usuario(nome: "José"), 2500.0)
            .constroi()
        
        stub(daoFalso) { (daoFalso) in
            when((daoFalso).encerrados()).thenReturn([playstation])
        }
        
        let geradorDePagamento = GeradorDePagamento(daoFalso, avaliador, pagamentos)
        geradorDePagamento.gera()
        
        let capturadorDeArgumento = ArgumentCaptor<Pagamento>()
        verify(pagamentos).salva(capturadorDeArgumento.capture())
        
        let pagamentoGerado = capturadorDeArgumento.value
        
        XCTAssertEqual(2500.0, pagamentoGerado?.getValor())
        
    }
    
    func testDeveEmpurrarParaProximoDiaUtil(){
        
        let iphone = CriadorDeLeilao().para(descricao: "Iphone 13 Pro")
            .lance(Usuario(nome: "Hygor"), 2000.0)
            .lance(Usuario(nome: "Nathiely"), 2500.0)
            .constroi()
        
        stub(daoFalso) { (daoFalso) in
            when(daoFalso.encerrados()).thenReturn([iphone])
        }
        
        let formatador = DateFormatter()
        formatador.dateFormat = "yyy/MM/dd"
        
        guard let dataAntiga = formatador.date(from: "2022/04/09") else { return }
        
        let geradorDePagamentos = GeradorDePagamento(daoFalso, avaliador, pagamentos, dataAntiga)
        geradorDePagamentos.gera()
        
        let capturadorDeArgumento = ArgumentCaptor<Pagamento>()
        
        verify(pagamentos).salva(capturadorDeArgumento.capture())
        
        let pagamentoGerado = capturadorDeArgumento.value
        
        let formatadorDeData = DateFormatter()
        formatadorDeData.dateFormat = "ccc"
        
        guard let dataDoPagamento = pagamentoGerado?.getData() else { return }
        let diaDaSemana = formatadorDeData.string(from: dataDoPagamento)
        
        XCTAssertEqual("seg.", diaDaSemana)
        
    }

}
