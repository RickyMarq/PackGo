//
//  PackageViewModel.swift
//  PackGo
//
//  Created by Henrique Marques on 15/09/22.
//

import Foundation

protocol PackageViewModelProtocols: AnyObject {
    func success()
    func failure()
}

class PackageViewModel {
    
    weak var delegate: PackageViewModelProtocols?
    
    var event: [Evento] = []
    var test: [UnidadeEndereco] = []
    
    init(delegate: PackageViewModelProtocols) {
        self.delegate = delegate
    }
    
    func GetData(code: String) {
        PackageService.sharedObjc.getPackage(packageCode: code) { pack, error in
            if error != nil {
                self.delegate?.failure()
            } else {
                self.event.append(contentsOf: pack!)
                self.test.append(self.event[0].unidade.endereco)
                self.delegate?.success()
            }
        }
    }
    
    var count: Int {
        return self.event.count
    }
    
    func GeIndex(indexPath: IndexPath) -> Evento {
        return self.event[indexPath.row]
    }
    
    func getTestIndex(indexPath: IndexPath) -> UnidadeEndereco {
        return self.event[0].unidade.endereco
    }
    
}
