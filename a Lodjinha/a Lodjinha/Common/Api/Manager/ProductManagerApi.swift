//
//  ProductManagerApi.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import Foundation

class ProductManagerApi: OperationQueue {
    
    func fetchTopSelled(completion: @escaping CallbackProducts) {
        guard let url = URL(string: BaseProvider.urlTopSelled) else { return }
        addOperation {
            ProductProvider.fetchProducts(url: url, completion: { (products) in
                OperationQueue.main.addOperation {
                    completion(products)
                }
            })
        }
    }
    
    func fetchProducts(idCategory: Int, completion: @escaping CallbackProducts) {
        let baseURL = "\(BaseProvider.urlProduct)?categoriaId=\(idCategory)"
        guard let url = URL(string: baseURL) else { return }
        addOperation {
            ProductProvider.fetchProducts(url: url, completion: { (products) in
                OperationQueue.main.addOperation {
                    completion(products)
                }
            })
        }
    }
    
    func fetchProduct(idProduct: Int, completion: @escaping CallbackProduct) {
        let baseURL = "\(BaseProvider.urlProduct)/\(idProduct)"
        guard let url = URL(string: baseURL) else { return }
        addOperation {
            ProductProvider.fetchProduct(url: url, completion: { (product) in
                OperationQueue.main.addOperation {
                    completion(product)
                }
            })
        }
    }
    
    func fetchReserve(idProduct: Int, completion: @escaping CallbackReserveResponse) {
        let baseURL = "\(BaseProvider.urlProduct)/\(idProduct)"
        guard let url = URL(string: baseURL) else { return }
        addOperation {
            ProductProvider.fetchReserve(url: url, completion: { (reserveResponse) in
                OperationQueue.main.addOperation {
                    completion(reserveResponse)
                }
            })
        }
    }
}
