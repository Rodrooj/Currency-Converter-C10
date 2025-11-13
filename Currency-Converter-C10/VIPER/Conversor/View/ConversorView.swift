//
//  ConversorView.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

import Foundation
import UIKit

class ConversorView: UIView, ConversorViewProtocol{
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           backgroundColor = .systemBackground
           UISetup()
       }
    
    required init?(coder: NSCoder) {
            super.init(coder: coder)
            UISetup()
        }
    
    private var moedaOrige: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Moeda estrangeira"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private var moedaFinal: UILabel = {
        let lb = UILabel()
        lb.text = "Moeda final"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private var converter: UIButton = {
        let bt = UIButton()
        bt.setTitle("Converter", for: .normal)
        bt.backgroundColor = .systemBlue
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.layer.cornerRadius = 8
        return bt
    }()
    
    private var historico: UIButton = {
        let bt = UIButton()
        bt.setTitle("Histórico", for: .normal)
        bt.setTitleColor(.systemBlue, for: .normal)
        bt.layer.borderColor = UIColor.systemBlue.cgColor
        bt.layer.borderWidth = 2
        bt.backgroundColor = .clear
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.layer.cornerRadius = 8
        bt.clipsToBounds = true
        return bt
    }()
    
    
    
    
    private func UISetup() {
        
        //Adiciona na view
        addSubview(moedaOrige)
        addSubview(moedaFinal)
        addSubview(converter)
        addSubview(historico)
        
        //Cria os tamanhos e limites dos elementos
        NSLayoutConstraint.activate([
            //Centraliza no meio horizontal
            moedaOrige.centerXAnchor.constraint(equalTo: leftAnchor, constant: 120),
            moedaFinal.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -80),
            converter.centerXAnchor.constraint(equalTo: centerXAnchor),
            historico.centerXAnchor.constraint(equalTo: centerXAnchor),
            //Coloca no topo (safearealayoutGuide.topanchor) porem a 200 pontos abaixo
            moedaOrige.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 200),
            moedaFinal.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 200),
            converter.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 250),
            historico.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 300),
            
            //Fixa a largura
            moedaOrige.widthAnchor.constraint(equalToConstant: 143),
            moedaFinal.widthAnchor.constraint(equalToConstant: 143),
            converter.widthAnchor.constraint(equalToConstant: 150),
            historico.widthAnchor.constraint(equalToConstant: 150),
            //Fixa a altura
            moedaOrige.heightAnchor.constraint(equalToConstant: 40),
            moedaFinal.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
}

#Preview {
    ConversorView()
}
