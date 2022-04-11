//
//  FormatadorData.swift
//  Leilao
//
//  Created by Ândriu Coelho on 22/05/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import Foundation

class FormatadorData {
    
    class func formataDataParaString(_ data:Date) -> String {
        let formatador = DateFormatter()
        formatador.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        return formatador.string(from: data)
    }
    
    class func formataStringParaData(_ data:String) -> Date? {
        let formatador = DateFormatter()
        formatador.dateFormat = "yyyy/MM/dd HH:mm:ss"
        guard let dataFormatada = formatador.date(from: data) else { return nil }
        
        return dataFormatada
    }
    
}
