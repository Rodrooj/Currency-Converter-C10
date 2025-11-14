//
//  ConversorView.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

import Foundation
import UIKit

class ConversorView: UIView {
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        UISetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        UISetup()
    }
    
    // MARK: - UI Components
 
    
    lazy var moedaPicker: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Selecione a moeda", for: .normal)
        bt.layer.borderColor = UIColor.systemBlue.cgColor
        bt.layer.borderWidth = 1
        bt.layer.cornerRadius = 8
        
        
        bt.showsMenuAsPrimaryAction = true
        bt.menu = UIMenu(title: "Escolha a Moeda", children: [
            UIAction(title: "Carregando...", attributes: .disabled, handler: { _ in })
        ])
        
        return bt
    }()
    
    // Propriedade para guardar a moeda
    var moedaSelecionada: Moeda?
    
    lazy var moedaOrige: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Valor"
        tf.keyboardType = .decimalPad
        tf.textAlignment = .center
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    lazy var moedaFinal: UILabel = {
        let lb = UILabel()
        lb.text = "R$ 0,00"
        lb.textAlignment = .center
        lb.layer.borderColor = UIColor.systemGray4.cgColor
        lb.layer.borderWidth = 1
        lb.layer.cornerRadius = 6
        return lb
    }()
    
    lazy var converterB: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Converter", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.backgroundColor = .systemBlue
        bt.layer.cornerRadius = 8
        bt.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        return bt
    }()
    
    lazy var historicoB: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Histórico", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.backgroundColor = .lightGray
        bt.layer.cornerRadius = 8
        bt.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        return bt
    }()
    
   
    
    // Stack Horizontal para o valor de origem e final
    private lazy var horizontalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [moedaOrige, moedaFinal])
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fillEqually
        return stack
    }()
    
    // Stack Vertical principal para organizar tudo
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [moedaPicker, horizontalStack, converterB, historicoB])
        stack.axis = .vertical
        stack.spacing = 24
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    // MARK: - Setup
    
    private func UISetup() {
        // Adiciona apenas a stack principal na view
        addSubview(mainStack)
        
        //  Define a altura dos botões
        moedaPicker.heightAnchor.constraint(equalToConstant: 50).isActive = true
        converterB.heightAnchor.constraint(equalToConstant: 50).isActive = true
        historicoB.heightAnchor.constraint(equalToConstant: 50).isActive = true
        moedaOrige.heightAnchor.constraint(equalToConstant: 44).isActive = true
        moedaFinal.heightAnchor.constraint(equalToConstant: 44).isActive = true

     
        NSLayoutConstraint.activate([
            // Centraliza a stack verticalmente na tela
            mainStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            // Prende nas laterais com uma margem de 20 pontos
            mainStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
}





