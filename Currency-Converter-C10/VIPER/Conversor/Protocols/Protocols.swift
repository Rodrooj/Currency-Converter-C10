//
//  Protocols.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

import UIKit

protocol ViewToPresenter: AnyObject {
    var view: PresenterToView? {get set}
    var interactor: PresenterToInteractor? {get set}
    var router: PresenterModulos? {get set}
    
//    var valorInserido: Double? { get}
//    var MoedaEscolhida: Moeda? { get}

    func BotaoHistoricoPressionado()
    func BotaoConversaoPressionado()
}

protocol PresenterToView: AnyObject {
     func mostrarValorConvertido(_ valor: Double)
}

protocol PresenterToInteractor: AnyObject {
    var presenter: InteractorToPresenter? {get set}
    
    var valorInserido: Double? {get}
    var MoedaEscolhida: Moeda? {get}
    
    func PedirConversao(valor: Double, moeda: Moeda)
}

protocol InteractorToPresenter: AnyObject {
    func enviarValorConvertido(valor: Double)
    
}

protocol PresenterModulos: AnyObject {
    func criarNavegacao() -> UIViewController
}

protocol Conversao {
    var moedaOrigem: Moeda { get }
    
    func converterParaReal(v: Double) -> Double
}
