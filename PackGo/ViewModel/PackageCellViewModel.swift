//
//  PackageCellViewModel.swift
//  PackGo
//
//  Created by Henrique Marques on 15/09/22.
//

import Foundation

class PackageCellViewModel {
    
    var object: Evento
    
    init(object: Evento) {
        self.object = object
    }
    
    var descricao: String {
        return object.descricao ?? "Error"
    }
    
    var unidade: String {
        return object.unidade.tipo ?? "Error"
    }
    
    var data: String {
        return object.dtHrCriado ?? "Error"
    }
    
}
