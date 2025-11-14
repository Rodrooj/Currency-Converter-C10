//
//  ConversorView.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

import Foundation
import UIKit

class ConversorView: UIView{
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           backgroundColor = .systemBackground
           UISetup()
       }
    
    required init?(coder: NSCoder) {
            super.init(coder: coder)
            UISetup()
        }
    
    let moedaPicker: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Selecione a moeda", for: .normal)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.layer.borderColor = UIColor.systemBlue.cgColor
        bt.layer.borderWidth = 1
        bt.layer.cornerRadius = 8
        return bt
    }()

    var moedaSelecionada:Moeda?
    
    var moedaOrige: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Digite o valor"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .numberPad
        return tf
    }()
    
    var moedaFinal: UILabel = {
        let lb = UILabel()
        lb.text = "Valor em reais"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let converterB: UIButton = {
        let bt = UIButton()
        bt.setTitle("Converter", for: .normal)
        bt.backgroundColor = .systemBlue
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.layer.cornerRadius = 8
        return bt
    }()
    
    
    var historico: UIButton = {
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
        addSubview(converterB)
        addSubview(historico)
        addSubview(moedaPicker)
        
        //Cria os tamanhos e limites dos elementos
        NSLayoutConstraint.activate([
            //Centraliza no meio horizontal
            moedaPicker.centerXAnchor.constraint(equalTo: leftAnchor, constant: 120),
            moedaOrige.centerXAnchor.constraint(equalTo: leftAnchor, constant: 120),
            moedaFinal.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -80),
            converterB.centerXAnchor.constraint(equalTo: centerXAnchor),
            historico.centerXAnchor.constraint(equalTo: centerXAnchor),
            //Coloca no topo (safearealayoutGuide.topanchor) porem a 200 pontos abaixo
            moedaPicker.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            moedaOrige.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 200),
            moedaFinal.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 200),
            converterB.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 250),
            historico.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 300),
            
            //Fixa a largura
            moedaPicker.widthAnchor.constraint(equalToConstant: 143),
            moedaOrige.widthAnchor.constraint(equalToConstant: 143),
            moedaFinal.widthAnchor.constraint(equalToConstant: 143),
            converterB.widthAnchor.constraint(equalToConstant: 150),
            historico.widthAnchor.constraint(equalToConstant: 150),
            //Fixa a altura
            moedaPicker.heightAnchor.constraint(equalToConstant: 50),
            moedaOrige.heightAnchor.constraint(equalToConstant: 40),
            moedaFinal.heightAnchor.constraint(equalToConstant: 40)
            
            
        ])
            
        }
        
    }


#Preview {
    ConversorView()
}

