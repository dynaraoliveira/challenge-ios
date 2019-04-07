//
//  ProductsDetailsViewController.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 07/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import UIKit

class ProductsDetailsViewController: UIViewController {

    @IBOutlet weak var productIV: UIImageView!
    @IBOutlet weak var descriptionLb: UILabel!
    @IBOutlet weak var fromPriceLb: UILabel!
    @IBOutlet weak var toPriceLb: UILabel!
    @IBOutlet weak var textTV: UITextView!
    @IBOutlet weak var reserveBt: UIButton!
    
    private var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupProductDetais()
    }
    
    func setProduct(_ product: Product) {
        self.product = product
    }
    
    private func setupNavBar() {
        navigationItem.title = product?.name
    }
    
    private func setupButton() {
        reserveBt.layer.cornerRadius = 10
        reserveBt.clipsToBounds = true
    }
    
    private func setupProductDetais() {
        guard let product = product, let url = URL(string: product.urlImage) else { return }
        
        let fromPrice = "De " + String(format: "%.2f", arguments: [product.fromPrice])
        
        productIV.loadImage(withURL: url)
        descriptionLb.text = product.name
        fromPriceLb.attributedText = fromPrice.setTrace()
        toPriceLb.text = "Por " + String(format: "%.2f", arguments: [product.toPrice])
        textTV.attributedText = product.description.htmlToString()
    }
    
    @IBAction func reserveClick(_ sender: Any) {
        
    }
}
