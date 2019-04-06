//
//  HomeViewController.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageNavBar()
    }

    private func setupImageNavBar() {
        let frame = CGRect(x: 0, y: 0, width: 270, height: 30)
        let logoContainer = UIView(frame: frame)
        
        let logoImage = UIImageView(frame: frame)
        logoImage.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "logoNavbar")
        logoImage.image = image
        
        logoContainer.addSubview(logoImage)
        navigationItem.titleView = logoContainer
    }

}

