//
//  EncerradorDeLeilaoTests.swift
//  LeilaoTests
//
//  Created by Hygor Martins on 09/04/22.
//  Copyright © 2022 Alura. All rights reserved.
//

import XCTest
import Cuckoo
@testable import Leilao

class EncerradorDeLeilaoTests: XCTestCase {
    
    var formatador:DateFormatter!
    var encerradorDeLeilao:EncerradorDeLeilao!
    var daoFalso:MockLeilaoDao!
    var carteiroFalso:MockCarteiro!
    
    override func setUpWithError() throws {
        formatador = DateFormatter()
        formatador.dateFormat = "yyyy/MM/dd"
        carteiroFalso = MockCarteiro().withEnabledSuperclassSpy()
        daoFalso = MockLeilaoDao().withEnabledSuperclassSpy()
        encerradorDeLeilao = EncerradorDeLeilao(daoFalso, carteiroFalso)
    }

    override func tearDownWithError() throws {
        
    }

    func testDeveEncerrarLeiloesQueComecaramUmaSemanaAntes(){
        
        guard let dataAntiga = formatador.date(from: "2018/04/09") else { return }
        
        let tvled = CriadorDeLeilao().para(descricao: "TV Led").naData(data: dataAntiga).constroi()
        let geladeira = CriadorDeLeilao().para(descricao: "Geladeira").naData(data: dataAntiga).constroi()
        
        let leiloesAntigos = [tvled, geladeira]
        
        stub(daoFalso) { (daoFalso) in
            when(daoFalso.correntes()).thenReturn(leiloesAntigos)
        }
        
        encerradorDeLeilao.encerra()
        
        guard let statusTvLed = tvled.isEncerrado() else { return }
        guard let statusGeladeira = geladeira.isEncerrado() else { return }
        
        XCTAssertEqual(2, encerradorDeLeilao.getTotalEncerrados())
        XCTAssertTrue(statusTvLed)
        XCTAssertTrue(statusGeladeira)
    }
    
    func testDeveAtualizarLeiloesEncerrados(){
        guard let dataAntiga = formatador.date(from: "2020/04/09") else { return }
        let tvLed = CriadorDeLeilao().para(descricao: "Tv Led").naData(data: dataAntiga).constroi()
    
        
        stub(daoFalso) { (daoFalso) in
            when(daoFalso.correntes()).thenReturn([tvLed])
        }
        
        encerradorDeLeilao.encerra()
        
        verify(daoFalso).atualiza(leilao: tvLed)
    }
    
    func testDeveContinuarExecucaoMesmoQuandoDaoFalha(){
        guard let dataAntiga = formatador.date(from: "2020/04/09") else { return }
        
        let tvLed = CriadorDeLeilao().para(descricao: "TV Led").naData(data: dataAntiga).constroi()
        let geladeira = CriadorDeLeilao().para(descricao: "Geladeira").naData(data: dataAntiga).constroi()
        
        let error = NSError(domain: "Error", code: 0, userInfo: nil)
        
        stub(daoFalso) { (daoFalso) in
            when(daoFalso.correntes()).thenReturn([tvLed, geladeira])
            when(daoFalso.atualiza(leilao: tvLed)).thenThrow(error)
        }
        
        encerradorDeLeilao.encerra()
        
        verify(daoFalso).atualiza(leilao: geladeira)
        verify(carteiroFalso).envia(geladeira)
        
    }

}

extension Leilao: Matchable {
    public var matcher:ParameterMatcher<Leilao> {
        return equal(to: self)
    }
}
