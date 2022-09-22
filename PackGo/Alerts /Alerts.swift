//
//  Alerts.swift
//  PackGo
//
//  Created by Henrique Marques on 22/09/22.
//

import UIKit

class Alerts: NSObject {
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert(title: String, message: String, titleBtn: String, completion:(() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: titleBtn, style: .cancel)
        alert.addAction(cancel)
        self.controller.present(alert, animated: true)
    }

}
