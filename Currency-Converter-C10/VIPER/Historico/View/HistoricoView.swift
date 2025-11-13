//
//  HistoricoView.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

import UIKit

class HistoricoView: UIViewController {
    var presenter: ViewToPresenterHistorico?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension HistoricoView: PresenterToViewHistorico {
    func mostrarRegistroFormatado(_ dado: Registro) {
        
    }
}

