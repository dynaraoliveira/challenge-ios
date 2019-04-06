//
//  BannerViewController.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import UIKit

class BannerViewController: UIViewController {

    @IBOutlet weak var bannerIV: UIImageView!
    
    private var banner: Banner?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
    }
    
    func loadBanner(_ banner: Banner) {
        self.banner = banner
    }
    
    func loadImage() {
        guard let banner = banner, let url = URL(string: banner.urlImage) else { return }
        bannerIV.loadImage(withURL: url)
    }
}
