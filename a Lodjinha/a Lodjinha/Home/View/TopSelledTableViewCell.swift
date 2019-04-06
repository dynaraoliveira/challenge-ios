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
        guard let url = URL(string: product.urlImage) else { return }
        topSelledIV.loadImage(withURL: url)
        topSelledDescriptionLb.text = product.name
        topSelledFromPriceLb.text = "De " + String(format: "%.2f", arguments: [product.fromPrice])
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
