//
//  ProductProvider.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import Foundation
import Alamofire

typealias CallbackProducts = (@escaping () -> ProductList?) -> Void
typealias CallbackProduct = (@escaping () -> Product?) -> Void
typealias CallbackReserveResponse = (@escaping () -> ProductReserveResponse?) -> Void

class ProductProvider: NSObject {
    static func fetchProducts(url: URL, completion: @escaping CallbackProducts) {
        Alamofire.request(url).validate().responseData { (response) in
            guard let data = response.data else { return }
            guard let products = try? JSONDecoder().decode(ProductList.self, from: data) else { return }
            
            completion { products }
        }
    }
    
    static func fetchProduct(url: URL, completion: @escaping CallbackProduct) {
        Alamofire.request(url).validate().responseData { (response) in
            guard let data = response.data else { return }
            guard let product = try? JSONDecoder().decode(Product.self, from: data) else { return }
            
            completion { product }
        }
    }
    
    static func fetchReserve(url: URL, completion: @escaping CallbackReserveResponse) {
        Alamofire.request(url, method: .post, encoding: URLEncoding.httpBody).validate().responseData { (response) in
        guard let data = response.data else { return }
    
        guard let productReserveResponse = try? JSONDecoder().decode(ProductReserveResponse.self, from: data) else { return }
    
        completion { productReserveResponse }
    
        }
    }
}
