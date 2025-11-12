//
//  ConversorPresenter.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

import Foundation
import UIKit

class Presenter: PresenterToView, PresenterToInteractor, PresenterToRouter {
    var view: PresenterToView?
    var interactor: PresenterToInteractor?
    var router: PresenterToRouter?
    
    init(valorInserido: Double, MoedaEscolhida: Moeda) {
        self.valorInserido = valorInserido
        self.MoedaEscolhida = MoedaEscolhida
    }
    
    // MARK: Interactor
    var valorInserido: Double
    var MoedaEscolhida: Moeda
    
    func PedirConversao() {
        
    }
    
    // MARK: View
    func mostrarValorConvertido(_ valor: Double) {
        
    }
    
    // MARK: Router
    func pedirViewHistorico() -> UIViewController {
        return UIViewController()
    }
    
    
}
