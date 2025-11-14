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
    var router: RouterModulos? {get set}
    
//    var valorInserido: Double? { get}
//    var MoedaEscolhida: Moeda? { get}
    func viewDidLoad()
    func BotaoHistoricoPressionado()
    func BotaoConversaoPressionado(valor: Double, moeda: Moeda)
}

protocol PresenterToView: AnyObject {
     func mostrarValorConvertido(_ valor: Double)
     func pegarMoedas(_ moedas: [Moeda])
}

protocol PresenterToInteractor: AnyObject {
    var presenter: InteractorToPresenter? {get set}
    
    func callAPI(completion: @escaping ([Moeda]) -> Void)
    func PedirConversao(valor: Double, moeda: Moeda)
}

protocol InteractorToPresenter: AnyObject {
    func enviarValorConvertido(valor: Double)
    func enviarMoedas()
    
}

protocol RouterModulos: AnyObject {
    func criarNavegacao() -> UIViewController
    func abrirTelaHistorico(view: UIViewController) 
}

protocol Conversao {
    var moedaOrigem: Moeda { get }
    
    func converterParaReal(v: Double) -> Double
}
