//
//  CategoryCollectionViewCell.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryIV: UIImageView!
    @IBOutlet weak var categoryDescriptionLb: UILabel!
    
    public func setupCategory(_ category : Category) {
        categoryDescriptionLb.text = category.description
        setupImage(url: category.imageUrl)
    }
    
    func setupImage(url: String) {
        guard let url = URL(string: url) else { return }
        categoryIV.loadImage(withURL: url)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        categoryIV.image = UIImage()
        categoryDescriptionLb.text = ""
    }
}
