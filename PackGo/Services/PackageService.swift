//
//  PackageService.swift
//  PackGo
//
//  Created by Henrique Marques on 13/09/22.
//

import Foundation

class PackageService {
    
    static let sharedObjc = PackageService()
    
    private init() { }
    
    func getPackage(packageCode: String, completion: @escaping ([Evento]?, Error?) -> Void) {
        guard let url = URL(string: "https://proxyapp.correios.com.br/v1/sro-rastro/" + packageCode) else {return}
        let session = URLSession.shared
        
        session.configuration.timeoutIntervalForResource = 5
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(Package.self, from: data)
                completion(model.objetos[0].eventos, nil)
            } catch {
                print("Error")
            }
        }
        task.resume()
    }
    
}


