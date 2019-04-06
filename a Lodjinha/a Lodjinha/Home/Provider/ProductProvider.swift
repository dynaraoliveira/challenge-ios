//
//  ProductProvider.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import Foundation
import Alamofire

typealias CallbackProduct = (@escaping () -> ProductList?) -> Void

class ProductProvider: NSObject {
    static func fetchProduct(url: URL, completion: @escaping CallbackProduct) {
        Alamofire.request(url).validate().responseData { (response) in
            guard let data = response.data else { return }
            guard let products = try? JSONDecoder().decode(ProductList.self, from: data) else { return }
            
            completion { products }
        }
    }
}
