//
//  Product.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import Foundation

struct Product: Codable {
    var category: Category
    var description: String
    var id: Int
    var name: String
    var fromPrice: Double
    var toPrice: Double
    var urlImage: String
    
    enum CodingKeys: String, CodingKey {
        case category = "categoria"
        case description = "descricao"
        case id
        case name = "nome"
        case fromPrice = "precoDe"
        case toPrice = "precoPor"
        case urlImage = "urlImagem"
    }
}

struct ProductList : Codable {
    var data : [Product]?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}
