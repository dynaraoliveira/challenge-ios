//
//  BannerManagerApi.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import Foundation

class BannerManagerApi: OperationQueue {
    
    func fetchBanners(completion: @escaping CallbackBanner) {
        guard let url = URL(string: BaseProvider.urlBanner) else { return }
        addOperation {
            BannerProvider.fetchBanners(url: url, completion: { (banners) in
                OperationQueue.main.addOperation {
                    completion(banners)
                }
            })
        }
    }
}
