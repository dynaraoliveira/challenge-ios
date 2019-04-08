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
        
        guard let banner = banner else { return }
        bannerIV.loadImage(withURL: banner.urlImage)

        let rectLeft = CGRect(x: 0, y: 0, width: 80, height: self.view.frame.height)
        let imageLeft = UIImageView(image: UIImage(named: "fillVerticalLeft"))
        imageLeft.frame = rectLeft
        bannerIV.addSubview(imageLeft)

        let rectRight = CGRect(x: self.view.frame.width - 80, y: 0, width: 80, height: self.view.frame.height)
        let imageRight = UIImageView(image: UIImage(named: "fillVerticalRight"))
        imageRight.frame = rectRight
        bannerIV.addSubview(imageRight)

        let rectBottom = CGRect(x: 0, y: bannerIV.frame.height, width: self.view.frame.width, height: 10)
        let imageBottom = UIImageView(image: UIImage(named: "fillVertical"))
        imageBottom.frame = rectBottom
        self.view.addSubview(imageBottom)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageBannerTapped))
        bannerIV.isUserInteractionEnabled = true
        bannerIV.addGestureRecognizer(tapGestureRecognizer)

    }
    
    @objc
    private func imageBannerTapped() {
        if let url = URL(string: banner?.linkUrl ?? "") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
}
