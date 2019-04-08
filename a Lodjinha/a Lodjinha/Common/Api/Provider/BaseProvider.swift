//
//  BaseProvider.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import Foundation

struct BaseProvider {
    
    static var urlBanner: String {
        return "https://alodjinha.herokuapp.com/banner"
    }
    
    static var urlCategory: String {
        return "https://alodjinha.herokuapp.com/categoria"
    }
    
    static var urlProduct: String {
        return "https://alodjinha.herokuapp.com/produto"
    }
    
    static var urlTopSelled: String {
        return "https://alodjinha.herokuapp.com/produto/maisvendidos"
    }
}
