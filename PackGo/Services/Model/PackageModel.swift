//
//  PackageModel.swift
//  PackGo
//
//  Created by Henrique Marques on 13/09/22.
//

import Foundation

struct Package: Codable {
    let objetos: [Objeto]
}

struct Objeto: Codable {
    let codObjeto: String?
    let eventos: [Evento]
}

struct Evento: Codable {
    let unidade: Unidade
    let descricao: String?
    let urlIcone: String?
    let dtHrCriado: String?
}

struct Unidade: Codable {
    let endereco: UnidadeEndereco
    let tipo: String?
}

struct UnidadeEndereco: Codable {
    let cidade: String?
    let uf: String?
    let bairro: String?
    let logradouro: String?
}

