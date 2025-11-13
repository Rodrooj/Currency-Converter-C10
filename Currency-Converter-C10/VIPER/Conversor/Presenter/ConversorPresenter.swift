//
//  ConversorPresenter.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//
import UIKit

class ConversorPresenter: ViewToPresenter {
    
    // Regra para a comunicação entre camadas
    var interactor: PresenterToInteractor?
    var router: PresenterModulos?
    weak var view: PresenterToView?
    
    // Conformidade com o protocolo
    var valorInserido: Double?
    var MoedaEscolhida: Moeda?
    
    func BotaoHistoricoPressionado() {
//        if let viewController = view as? UIViewController {
//            router?.abrirTelaHistorico(view: viewController)
//        }
        print("Coisa para se preocupar no futuro")
    }
    
    func BotaoConversaoPressionado() {
        guard let valor = valorInserido, let moeda = MoedaEscolhida else {
            print("Erro por falta de definição")
            return
        }
        interactor?.PedirConversao(valor: valor, moeda: moeda) // Aqui você literalmente vai no arquivo ConversorInteractor e chama a função. É como se o router substituisse o ConversorInteractor().Pedir... por apenas interactor?.Pedir... 
    }
}

extension ConversorPresenter: InteractorToPresenter {
    
    // Aqui, é declarado que a função enviarValorConvertido, quando chamada, envia o valor de si para a View, com a função mostrarValorConvertido
    func enviarValorConvertido(valor: Double) {
        view?.mostrarValorConvertido(valor)
    }
}
