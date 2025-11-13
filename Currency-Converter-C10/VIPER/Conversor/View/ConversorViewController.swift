//
//  ConversorViewController.swift
//  Currency-Converter-C10
//
//  Created by Wise on 12/11/25.
//

import UIKit

final class ConversorViewController: UIViewController{
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var presenter: ConversorPresenter
    
    private let conversorView = ConversorView()
    
    override func loadView() {
        view = conversorView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    
    
}
