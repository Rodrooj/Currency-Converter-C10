//
//  ConversorRouter.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

import UIKit

class ConversorRouter: RouterModulos {
    func abrirTelaHistorico(view: UIViewController) {
        let telaHistorico = HistoricoView()
        view.present(telaHistorico, animated: true)
    }
    
    func criarNavegacao() -> UIViewController {
        // Primeiramente eu instanciei cada camada
        let view = ConversorViewController()
        let interactor = ConversorInteractor()
        let presenter = ConversorPresenter()
        let router = ConversorRouter()

        // Depois, é necessário conectar cada camada de acordo com a passagem de dados que é feita entre elas. Cada classe precisa conformar com o protocolo correto para isso dar certo. Isso é a alma do negócio, por que 
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter

        
        return view
    }
    
    func irParaHistorico (from view: UIViewController) {
        let hist = HistoricoRouter()
        let histVC = hist.criarNavegacaoHistorico()
        view.navigationController?.pushViewController(histVC, animated: true)
    }
}


