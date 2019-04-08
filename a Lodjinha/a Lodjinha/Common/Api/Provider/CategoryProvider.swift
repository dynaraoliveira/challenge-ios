//
//  CategoryProvider.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import Foundation
import Alamofire

typealias CallbackCategory = (@escaping () -> CategoryList?) -> Void

class CategoryProvider: NSObject {
    static func fetchCategory(url: URL, completion: @escaping CallbackCategory) {
        Alamofire.request(url).validate().responseData { (response) in
            guard let data = response.data else { return }
            guard let categories = try? JSONDecoder().decode(CategoryList.self, from: data) else { return }
            
            completion { categories }
        }
    }
}
