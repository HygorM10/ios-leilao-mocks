//
//  LeilaoDao.swift
//  Leilao
//
//  Created by Ândriu Coelho on 22/05/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit

enum ErroLeilaoDao:Error{
    case NaoAtualizou(String)
}

class LeilaoDao: NSObject {
    
    private var dataBase : OpaquePointer? = nil
    
    private var caminhoSQLite:String {
        let home = NSHomeDirectory()
        let caminhoParaDocumentos = (home as NSString).appendingPathComponent("Documents")
        return (caminhoParaDocumentos as NSString).appendingPathComponent("leilao.sqlite")
    }
    
    override init() {
        super.init()
        if FileManager.default.fileExists(atPath: caminhoSQLite) {
            sqlite3_open(caminhoSQLite, &dataBase)
        }
        else {
            sqlite3_open(caminhoSQLite, &dataBase)
            let sqlLeilao = "create table if not exists LEILAO (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, descricao TEXT, data TEXT, encerrado INTEGER)"
            executaQuery(sqlLeilao)
            
            let sqlLance = "create table if not exists LANCE (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, leilao_id INTEGER, usuario_id INTEGER, valor REAL)"
            executaQuery(sqlLance)
        }
    }
    
    func executaQuery(_ sql:String) {
        sqlite3_exec(dataBase, sql, nil, nil, nil)
    }
    
    func salva(_ leilao:Leilao) {
        guard let status = leilao.encerrado else { return }
        let statusLeilao = status ? 1 : 0
        
        guard let data = leilao.data else { return }
        let dataDoLeilao = FormatadorData.formataDataParaString(data)
        
        var sql = "insert into LEILAO values (NULL, '\(leilao.descricao)', '\(dataDoLeilao)', '\(statusLeilao)')"
        executaQuery(sql)
        
        guard let lances = leilao.lances else { return }
        for lance in lances {
            guard let idDoLeilao = leilao.id else { return }
            guard let idDoUsuario = lance.usuario.id else { return }
            sql = "insert into LANCE values (NULL, '\(idDoLeilao)', '\(idDoUsuario)', '\(lance.valor)')"
            executaQuery(sql)
        }
    }
    
    func correntes() -> [Leilao] {
        return porEncerrado(false)
    }
    
    func encerrados() -> [Leilao] {
        return porEncerrado(true)
    }
    
    private func porEncerrado(_ status:Bool) -> [Leilao] {
        let statusLeilao = status ? 1 : 0
        let sql = "select * from LEILAO where encerrado = \(statusLeilao)"
        var resultado : OpaquePointer? = nil
        var listaDeLeilao:[Leilao] = []
        if (sqlite3_prepare_v2(dataBase, sql, -1, &resultado, nil) == SQLITE_OK) {
            while (sqlite3_step(resultado) == SQLITE_ROW) {
                let resultadoId = sqlite3_column_int(resultado, 0)
                let id = Int(resultadoId)
                
                guard let resultadoDesc = sqlite3_column_text(resultado, 1) else { return [] }
                let descricao = String(cString: resultadoDesc)
                
                guard let resultadoData = sqlite3_column_text(resultado, 2) else { return [] }
                guard let data = FormatadorData.formataStringParaData(String(cString: resultadoData)) else { return [] }
                
                guard let resultadoEncerrado = sqlite3_column_text(resultado, 3) else { return [] }
                let encerrado = String(cString: resultadoEncerrado) as NSString
                let statusDoLeilao = encerrado.boolValue
                
                let leilao = Leilao(id: id, descricao: descricao, imagem: "", lances: [], data: data, encerrado: statusDoLeilao)
                listaDeLeilao.append(leilao)
            }
        }
        return listaDeLeilao
    }
    
    func atualiza(leilao:Leilao) throws {
        guard let idDoLeilao = leilao.id else { return }
        
        guard let status = leilao.encerrado else { return }
        let statusDoLeilao = status ? 1 : 0
        
        guard let data = leilao.data else { return }
        let dataDoLeilao = FormatadorData.formataDataParaString(data)
        
        let sql = "update LEILAO set descricao = '\(leilao.descricao)', encerrado = '\(statusDoLeilao)', data = '\(dataDoLeilao)' where id = '\(idDoLeilao)'"
        
        if !(sqlite3_exec(dataBase, sql, nil, nil, nil) == SQLITE_OK) {
            throw ErroLeilaoDao.NaoAtualizou("Erro ao atualizar leilao")
        }
    }
}
