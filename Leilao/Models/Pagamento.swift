//
//  Pagamento.swift
//  Leilao
//
//  Created by Hygor Martins on 09/04/22.
//  Copyright © 2022 Alura. All rights reserved.
//

import Foundation

class Pagamento{
    
    private var valor:Double
    private var data:Date
    
    init(_ valor:Double, _ data:Date){
        self.valor = valor
        self.data = data
    }
    
    func getValor() -> Double {
        return valor
    }
    
    func getData() -> Date{
        return data
    }
    
}
