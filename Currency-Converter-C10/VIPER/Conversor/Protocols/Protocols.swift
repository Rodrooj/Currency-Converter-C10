//
//  Protocols.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

import UIKit

protocol ViewToPresenter: AnyObject {
    var valorInserido: Double { get}
    var MoedaEscolhida: Moeda { get}

    
    func BotaoHistoricoPressionado()
    func BotaoConversaoPressionado()
}

protocol PresenterToView: AnyObject {
//    var valorConvertido: Double {get set}
    
     func mostrarValorConvertido(_ valor: Double)
}

protocol PresenterToInteractor: AnyObject {
    var valorInserido: Double {get}
    var MoedaEscolhida: Moeda {get}
    
    func PedirConversao()
}

protocol InteractorToPresenter: AnyObject {
    var valorConvertido: Double {get set}
    
    func enviarValorConvertido(_ valor: Double)
    
}

protocol PresenterToRouter: AnyObject {
    func criarViewHistorico() -> UIViewController
}

protocol Conversao {
    var moedaOrigem: Moeda { get }
    
    func converterParaReal(v: Double) -> Double
}
