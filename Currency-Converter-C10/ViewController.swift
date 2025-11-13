//
//  ViewController.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func openConversor(_ sender: UIButton) {
            let rout = ConversorRouter()
        let vc = rout.criarNavegacao()   // <-- programmatic screen
            navigationController?.pushViewController(vc, animated: true)
        }

}

