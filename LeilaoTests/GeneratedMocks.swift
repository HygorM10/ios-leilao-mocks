// MARK: - Mocks generated from file: Leilao/Dao/LeilaoDao.swift at 2022-04-09 19:14:46 +0000

//
//  LeilaoDao.swift
//  Leilao
//
//  Created by Ândriu Coelho on 22/05/18.
//  Copyright © 2018 Alura. All rights reserved.
//
import Cuckoo
@testable import Leilao

import UIKit


 class MockLeilaoDao: LeilaoDao, Cuckoo.ClassMock {
    
     typealias MocksType = LeilaoDao
    
     typealias Stubbing = __StubbingProxy_LeilaoDao
     typealias Verification = __VerificationProxy_LeilaoDao

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: LeilaoDao?

     func enableDefaultImplementation(_ stub: LeilaoDao) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func executaQuery(_ sql: String)  {
        
    return cuckoo_manager.call("executaQuery(_: String)",
            parameters: (sql),
            escapingParameters: (sql),
            superclassCall:
                
                super.executaQuery(sql)
                ,
            defaultCall: __defaultImplStub!.executaQuery(sql))
        
    }
    
    
    
     override func salva(_ leilao: Leilao)  {
        
    return cuckoo_manager.call("salva(_: Leilao)",
            parameters: (leilao),
            escapingParameters: (leilao),
            superclassCall:
                
                super.salva(leilao)
                ,
            defaultCall: __defaultImplStub!.salva(leilao))
        
    }
    
    
    
     override func correntes() -> [Leilao] {
        
    return cuckoo_manager.call("correntes() -> [Leilao]",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.correntes()
                ,
            defaultCall: __defaultImplStub!.correntes())
        
    }
    
    
    
     override func encerrados() -> [Leilao] {
        
    return cuckoo_manager.call("encerrados() -> [Leilao]",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.encerrados()
                ,
            defaultCall: __defaultImplStub!.encerrados())
        
    }
    
    
    
     override func atualiza(leilao: Leilao) throws {
        
    return try cuckoo_manager.callThrows("atualiza(leilao: Leilao) throws",
            parameters: (leilao),
            escapingParameters: (leilao),
            superclassCall:
                
                super.atualiza(leilao: leilao)
                ,
            defaultCall: __defaultImplStub!.atualiza(leilao: leilao))
        
    }
    

	 struct __StubbingProxy_LeilaoDao: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func executaQuery<M1: Cuckoo.Matchable>(_ sql: M1) -> Cuckoo.ClassStubNoReturnFunction<(String)> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: sql) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLeilaoDao.self, method: "executaQuery(_: String)", parameterMatchers: matchers))
	    }
	    
	    func salva<M1: Cuckoo.Matchable>(_ leilao: M1) -> Cuckoo.ClassStubNoReturnFunction<(Leilao)> where M1.MatchedType == Leilao {
	        let matchers: [Cuckoo.ParameterMatcher<(Leilao)>] = [wrap(matchable: leilao) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLeilaoDao.self, method: "salva(_: Leilao)", parameterMatchers: matchers))
	    }
	    
	    func correntes() -> Cuckoo.ClassStubFunction<(), [Leilao]> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockLeilaoDao.self, method: "correntes() -> [Leilao]", parameterMatchers: matchers))
	    }
	    
	    func encerrados() -> Cuckoo.ClassStubFunction<(), [Leilao]> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockLeilaoDao.self, method: "encerrados() -> [Leilao]", parameterMatchers: matchers))
	    }
	    
	    func atualiza<M1: Cuckoo.Matchable>(leilao: M1) -> Cuckoo.ClassStubNoReturnThrowingFunction<(Leilao)> where M1.MatchedType == Leilao {
	        let matchers: [Cuckoo.ParameterMatcher<(Leilao)>] = [wrap(matchable: leilao) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLeilaoDao.self, method: "atualiza(leilao: Leilao) throws", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_LeilaoDao: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func executaQuery<M1: Cuckoo.Matchable>(_ sql: M1) -> Cuckoo.__DoNotUse<(String), Void> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: sql) { $0 }]
	        return cuckoo_manager.verify("executaQuery(_: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func salva<M1: Cuckoo.Matchable>(_ leilao: M1) -> Cuckoo.__DoNotUse<(Leilao), Void> where M1.MatchedType == Leilao {
	        let matchers: [Cuckoo.ParameterMatcher<(Leilao)>] = [wrap(matchable: leilao) { $0 }]
	        return cuckoo_manager.verify("salva(_: Leilao)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func correntes() -> Cuckoo.__DoNotUse<(), [Leilao]> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("correntes() -> [Leilao]", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func encerrados() -> Cuckoo.__DoNotUse<(), [Leilao]> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("encerrados() -> [Leilao]", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func atualiza<M1: Cuckoo.Matchable>(leilao: M1) -> Cuckoo.__DoNotUse<(Leilao), Void> where M1.MatchedType == Leilao {
	        let matchers: [Cuckoo.ParameterMatcher<(Leilao)>] = [wrap(matchable: leilao) { $0 }]
	        return cuckoo_manager.verify("atualiza(leilao: Leilao) throws", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class LeilaoDaoStub: LeilaoDao {
    

    

    
    
    
     override func executaQuery(_ sql: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
     override func salva(_ leilao: Leilao)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
     override func correntes() -> [Leilao]  {
        return DefaultValueRegistry.defaultValue(for: ([Leilao]).self)
    }
    
    
    
     override func encerrados() -> [Leilao]  {
        return DefaultValueRegistry.defaultValue(for: ([Leilao]).self)
    }
    
    
    
     override func atualiza(leilao: Leilao) throws  {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: Leilao/Models/Carteiro.swift at 2022-04-09 19:14:46 +0000

//
//  Carteiro.swift
//  Leilao
//
//  Created by Hygor Martins on 09/04/22.
//  Copyright © 2022 Alura. All rights reserved.
//

import Cuckoo
@testable import Leilao

import Foundation


 class MockCarteiro: Carteiro, Cuckoo.ClassMock {
    
     typealias MocksType = Carteiro
    
     typealias Stubbing = __StubbingProxy_Carteiro
     typealias Verification = __VerificationProxy_Carteiro

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: Carteiro?

     func enableDefaultImplementation(_ stub: Carteiro) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func envia(_ leilao: Leilao)  {
        
    return cuckoo_manager.call("envia(_: Leilao)",
            parameters: (leilao),
            escapingParameters: (leilao),
            superclassCall:
                
                super.envia(leilao)
                ,
            defaultCall: __defaultImplStub!.envia(leilao))
        
    }
    

	 struct __StubbingProxy_Carteiro: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func envia<M1: Cuckoo.Matchable>(_ leilao: M1) -> Cuckoo.ClassStubNoReturnFunction<(Leilao)> where M1.MatchedType == Leilao {
	        let matchers: [Cuckoo.ParameterMatcher<(Leilao)>] = [wrap(matchable: leilao) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCarteiro.self, method: "envia(_: Leilao)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_Carteiro: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func envia<M1: Cuckoo.Matchable>(_ leilao: M1) -> Cuckoo.__DoNotUse<(Leilao), Void> where M1.MatchedType == Leilao {
	        let matchers: [Cuckoo.ParameterMatcher<(Leilao)>] = [wrap(matchable: leilao) { $0 }]
	        return cuckoo_manager.verify("envia(_: Leilao)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class CarteiroStub: Carteiro {
    

    

    
    
    
     override func envia(_ leilao: Leilao)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: Leilao/Models/RepositorioDePagamento.swift at 2022-04-09 19:14:46 +0000

//
//  RepositorioDePagamento.swift
//  Leilao
//
//  Created by Hygor Martins on 09/04/22.
//  Copyright © 2022 Alura. All rights reserved.
//

import Cuckoo
@testable import Leilao

import Foundation


 class MockRepositorioDePagamento: RepositorioDePagamento, Cuckoo.ClassMock {
    
     typealias MocksType = RepositorioDePagamento
    
     typealias Stubbing = __StubbingProxy_RepositorioDePagamento
     typealias Verification = __VerificationProxy_RepositorioDePagamento

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: RepositorioDePagamento?

     func enableDefaultImplementation(_ stub: RepositorioDePagamento) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func salva(_ pagamento: Pagamento)  {
        
    return cuckoo_manager.call("salva(_: Pagamento)",
            parameters: (pagamento),
            escapingParameters: (pagamento),
            superclassCall:
                
                super.salva(pagamento)
                ,
            defaultCall: __defaultImplStub!.salva(pagamento))
        
    }
    

	 struct __StubbingProxy_RepositorioDePagamento: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func salva<M1: Cuckoo.Matchable>(_ pagamento: M1) -> Cuckoo.ClassStubNoReturnFunction<(Pagamento)> where M1.MatchedType == Pagamento {
	        let matchers: [Cuckoo.ParameterMatcher<(Pagamento)>] = [wrap(matchable: pagamento) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRepositorioDePagamento.self, method: "salva(_: Pagamento)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_RepositorioDePagamento: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func salva<M1: Cuckoo.Matchable>(_ pagamento: M1) -> Cuckoo.__DoNotUse<(Pagamento), Void> where M1.MatchedType == Pagamento {
	        let matchers: [Cuckoo.ParameterMatcher<(Pagamento)>] = [wrap(matchable: pagamento) { $0 }]
	        return cuckoo_manager.verify("salva(_: Pagamento)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class RepositorioDePagamentoStub: RepositorioDePagamento {
    

    

    
    
    
     override func salva(_ pagamento: Pagamento)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

