//
//  ViewController.swift
//  PackGo
//
//  Created by Henrique Marques on 13/09/22.
//

import UIKit

class SearchController: UIViewController {
    
    var searchScreen: SearchScreen?
    
    override func loadView() {
        self.searchScreen = SearchScreen()
        self.view = searchScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchScreen?.packCodeTextFieldProtocols(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func getPackage() {
        let vc = PackageController(package: (self.searchScreen?.packCodeTextField.text)!)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchScreen?.packCodeTextField.resignFirstResponder()
        self.getPackage()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.searchScreen?.packCodeTextField.resignFirstResponder()
        self.searchScreen?.endEditing(true)
    }
    
}
