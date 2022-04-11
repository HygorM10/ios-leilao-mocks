//
//  EncerradorDeLeilao.swift
//  Leilao
//
//  Created by Ândriu Coelho on 22/05/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import Foundation

class EncerradorDeLeilao {
    
    private var total = 0
    private var dao:LeilaoDao
    private var carteiro:Carteiro
    
    init(_ leilaoDao: LeilaoDao, _ carteiro:Carteiro) {
        self.dao = leilaoDao
        self.carteiro = carteiro
    }
    
    func encerra() {
        let todosLeiloesCorrentes = dao.correntes()
        for leilao in todosLeiloesCorrentes {
            if comecouSemanaPassada(leilao) {
                leilao.encerra()
                total+=1
                do {
                    try dao.atualiza(leilao: leilao)
                    carteiro.envia(leilao)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getTotalEncerrados() -> Int {
        return total
    }
    
    private func comecouSemanaPassada(_ leilao:Leilao) -> Bool {
        guard let data = leilao.data else { return false }
        return diasEntre(data) >= 7
    }
    
    private func diasEntre(_ dataLeilao:Date) -> Int {
        var data = dataLeilao
        var diasNoIntervalo = 0
        while data <= Date() {
            data = Calendar.current.date(byAdding: .day, value: 1, to: data)!
            diasNoIntervalo+=1
        }
        return diasNoIntervalo
    }
    
}
