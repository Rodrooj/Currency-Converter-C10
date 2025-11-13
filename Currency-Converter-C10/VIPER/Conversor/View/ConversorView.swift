//
//  ConversorView.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

import UIKit

class ConversorView: UIViewController {
    
    // variavel temporária para permitir comunicação entre as camadas
    // É nela que o valor convertido chega depois de passar por todas as camadas do app
    var ValorConvertido: Double?
    var presenter: ViewToPresenter?
    

    override func viewDidLoad() {
        
        
       
        // Isso vai dentro de um botão
        presenter?.BotaoConversaoPressionado()
        
        presenter?.BotaoHistoricoPressionado()
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


// É através dessa extensão que essa classe se conforma ao presenter.view. Pois ela é do tipo PresenterToView. No caso, é de onde o dado chega da presenter.
extension ConversorView: PresenterToView {
    
    // Aqui a view estaria armazenando em Valor convertido o valor que veio da presenter, que veio do interactor
    func mostrarValorConvertido(_ valor: Double) {
        ValorConvertido = valor
    }
}

