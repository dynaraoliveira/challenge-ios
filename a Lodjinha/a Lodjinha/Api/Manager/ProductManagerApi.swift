//
//  ProductManagerApi.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import Foundation

class ProductManagerApi: OperationQueue {
    
    func fetchTopSelled(completion: @escaping CallbackProduct) {
        guard let url = URL(string: BaseProvider.urlTopSelled) else { return }
        addOperation {
            ProductProvider.fetchProduct(url: url, completion: { (products) in
                OperationQueue.main.addOperation {
                    completion(products)
                }
            })
        }
    }
    
    func fetchProducts(completion: @escaping CallbackProduct) {
        guard let url = URL(string: BaseProvider.urlProduct) else { return }
        addOperation {
            ProductProvider.fetchProduct(url: url, completion: { (products) in
                OperationQueue.main.addOperation {
                    completion(products)
                }
            })
        }
    }
    
}
