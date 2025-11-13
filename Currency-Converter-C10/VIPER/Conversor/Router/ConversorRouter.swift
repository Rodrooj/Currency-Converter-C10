//
//  ConversorRouter.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

import UIKit

class ConversorRouter: RouterModulos {
    func criarNavegacao() -> UIViewController {
        // Primeiramente eu instanciei cada camada
        var view = ConversorView()
        var interactor = ConversorInteractor()
        var presenter = ConversorPresenter()
        var router = ConversorRouter()

        // Depois, é necessário conectar cada camada de acordo com a passagem de dados que é feita entre elas. Cada classe precisa conformar com o protocolo correto para isso dar certo. Isso é a alma do negócio, por que 
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter

        
        return view
    }
}

// Não consegui fazer a navegação, pois a ausência de telas na parte do Historico estava me dando muito trabalho. Acabei não aplicando a navegação em si do Router.
extension ConversorRouter {
//    func abrirTelaHistorico(view: UIViewController) {
//        let telaHistorico = HistoricoRouter().criarNavegacao()
//        
//        view.present(telaHistorico, animated: true)
//    }
}
