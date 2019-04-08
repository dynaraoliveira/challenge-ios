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

    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
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
    
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 4.0
        self.navigationController?.navigationBar.layer.shadowOpacity = 1.0
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.tintColor = .white
        
    }

}

