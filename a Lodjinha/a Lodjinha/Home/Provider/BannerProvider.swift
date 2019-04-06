//
//  BannerProvider.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import Foundation
import Alamofire

typealias CallbackBanner = (@escaping () -> BannerList?) -> Void

class BannerProvider: NSObject {
    static func fetchBanners(url: URL, completion: @escaping CallbackBanner) {
        Alamofire.request(url).validate().responseData { (response) in
            guard let data = response.data else {
                print("Failed to get data")
                return
            }
            guard let banners = try? JSONDecoder().decode(BannerList.self, from: data) else {
                print("Failed to parse banners")
                return
            }
            
            completion { banners }
        }
    }
}
