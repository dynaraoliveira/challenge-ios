//
//  CategoryManagerApi.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import Foundation

class CategoryManagerApi: OperationQueue {
    
    func fetchCategories(completion: @escaping CallbackCategory) {
        guard let url = URL(string: BaseProvider.urlCategory) else { return }
        addOperation {
            CategoryProvider.fetchCategory(url: url, completion: { (categories) in
                OperationQueue.main.addOperation {
                    completion(categories)
                }
            })
        }
    }
}
