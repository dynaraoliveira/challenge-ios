//
//  ProductTableViewCell.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productIV: UIImageView?
    @IBOutlet weak var productDescriptionLb: UILabel?
    @IBOutlet weak var productFromPriceLb: UILabel?
    @IBOutlet weak var productToPriceLb: UILabel?
    
    func setupProduct(_ product: Product) {
        guard let url = URL(string: product.urlImage) else { return }
        productIV?.loadImage(withURL: url)
        productDescriptionLb?.text = product.name
        productFromPriceLb?.text = "De " + String(format: "%.2f", arguments: [product.fromPrice])
        productToPriceLb?.text = "Por " + String(format: "%.2f", arguments: [product.toPrice])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productDescriptionLb?.text = ""
        productFromPriceLb?.attributedText = NSAttributedString()
        productToPriceLb?.text = ""
        productIV?.image = UIImage()
    }
    
}
