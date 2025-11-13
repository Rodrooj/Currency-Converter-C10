//
//  HistoricoRouter.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

import UIKit

class HistoricoRouter: HistoricoModulos {
    func criarNavegacaoHistorico() -> UIViewController {
        // Navegação entre arquivos
        var view = HistoricoView()
        var interactor = HistoricoInteractor()
        var presenter = HistoricoPresenter()
        var router = HistoricoRouter()
        
        // Intanciando cada tela entre cada tela. Permite a realização de funções entre arquivos.
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
