//
//  Leilao.swift
//  Leilao
//
//  Created by Ândriu Coelho on 27/04/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import Foundation

class Leilao {
    
    let id:Int?
    let descricao:String
    let imagem:String?
    var lances:[Lance]?
    var data:Date?
    var encerrado:Bool?
    
    init(id:Int? = nil, descricao:String, imagem:String? = nil, lances:[Lance] = [], data:Date? = nil, encerrado:Bool? = false) {
        self.id = id
        self.descricao = descricao
        self.imagem = imagem
        self.lances = lances
        self.data = data
        self.encerrado = encerrado
    }
    
    func propoe(lance:Lance) {
        guard let listaDeLances = lances else { return }
        if listaDeLances.count == 0 || podeDarLance(lance.usuario, listaDeLances) {
            lances?.append(lance)
        }
    }
    
    private func ultimoLance(_ lances:[Lance]) -> Lance {
        return lances[lances.count-1]
    }
    
    private func podeDarLance(_ usuario:Usuario, _ listaDeLances:[Lance]) -> Bool {
        return ultimoLance(listaDeLances).usuario != usuario && quantidadeLancesDoUsuario(usuario) < 5
    }
    
    private func quantidadeLancesDoUsuario(_ usuario:Usuario) -> Int {
        guard let listaDeLances = lances else { return 0 }
        var total = 0
        for lanceAtual in listaDeLances {
            if lanceAtual.usuario == usuario {
                total+=1
            }
        }
        
        return total
    }
    
    func encerra() {
        self.encerrado = true
    }
    
    func isEncerrado() -> Bool? {
        return encerrado
    }
}
