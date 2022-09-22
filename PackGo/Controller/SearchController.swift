//
//  ViewController.swift
//  PackGo
//
//  Created by Henrique Marques on 13/09/22.
//

import UIKit

class SearchController: UIViewController {
    
    var searchScreen: SearchScreen?
    var alertManager: Alerts?
    
    override func loadView() {
        self.searchScreen = SearchScreen()
        self.view = searchScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchScreen?.packCodeTextFieldProtocols(delegate: self)
        self.alertManager = Alerts(controller: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func getPackage() {
        
        if self.searchScreen?.packCodeTextField.text == "" {
            self.alertManager?.getAlert(title: "Erro", message: "Insira um valor válido", titleBtn: "Cancelar")
        } else {
            let vc = PackageController(package: (self.searchScreen?.packCodeTextField.text)!)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension SearchController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchScreen?.packCodeTextField.resignFirstResponder()
        self.getPackage()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.searchScreen?.endEditing(true)
    }
    
}
