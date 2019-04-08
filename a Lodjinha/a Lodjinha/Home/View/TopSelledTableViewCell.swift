//
//  TopSelledTableViewCell.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import UIKit

class TopSelledTableViewCell: UITableViewCell {

    @IBOutlet weak var topSelledIV: UIImageView!
    @IBOutlet weak var topSelledDescriptionLb: UILabel!
    @IBOutlet weak var topSelledFromPriceLb: UILabel!
    @IBOutlet weak var topSelledToPriceLb: UILabel!
    
    func setupProduct(_ product: Product) {
        let fromPrice = "De " + String(format: "%.2f", arguments: [product.fromPrice])
        topSelledIV.loadImage(withURL: product.urlImage)
        topSelledDescriptionLb.text = product.name
        topSelledFromPriceLb.attributedText = fromPrice.setTrace()
        topSelledToPriceLb.text = "Por " + String(format: "%.2f", arguments: [product.toPrice])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        topSelledDescriptionLb.text = ""
        topSelledFromPriceLb.attributedText = NSAttributedString()
        topSelledToPriceLb.text = ""
        topSelledIV.image = UIImage()
    }

}
