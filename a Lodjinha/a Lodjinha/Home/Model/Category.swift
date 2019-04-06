//
//  Category.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import Foundation

struct Category: Codable {
    let id: Int
    let description: String
    let imageUrl: String
        
    enum CodingKeys: String, CodingKey {
        case id
        case description = "descricao"
        case imageUrl = "urlImagem"
    }
}

struct CategoryList: Codable {
    var data : [Category]?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}
