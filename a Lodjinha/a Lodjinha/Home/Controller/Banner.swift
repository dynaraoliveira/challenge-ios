//
//  Banner.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import Foundation

struct Banner: Codable {
    let id: Int
    let linkUrl: String
    let urlImage: String
    
    private enum CodingKeys: String, CodingKey {
        case id, linkUrl
        case urlImage = "urlImagem"
    }
}

struct BannerList: Codable {
    var data: [Banner]?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}
