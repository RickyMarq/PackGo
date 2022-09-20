//
//  PackageCellViewModel.swift
//  PackGo
//
//  Created by Henrique Marques on 15/09/22.
//

import Foundation

class PackageCellViewModel {
    
    var object: Evento
    var test: UnidadeEndereco
    
    init(object: Evento, test: UnidadeEndereco) {
        self.object = object
        self.test = test
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
    
    var image: String {
        return object.urlIcone ?? "Error"
        
    }
    
    var cidade: String {
        return test.cidade  ?? "Error"
    }
    
    var uf: String {
        return test.uf ?? "Error"
    
    }
}
