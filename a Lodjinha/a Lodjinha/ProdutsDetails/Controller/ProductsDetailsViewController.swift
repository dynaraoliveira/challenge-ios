//
//  ProductsDetailsViewController.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 07/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import UIKit

class ProductsDetailsViewController: UIViewController {

    private let productManagerApi = ProductManagerApi()
    
    @IBOutlet weak var productIV: UIImageView!
    @IBOutlet weak var descriptionLb: UILabel!
    @IBOutlet weak var fromPriceLb: UILabel!
    @IBOutlet weak var toPriceLb: UILabel!
    @IBOutlet weak var textDescriptionLb: UILabel!
    @IBOutlet weak var textTV: UITextView!
    @IBOutlet weak var reserveBt: UIButton!
    
    private var idProduct: Int?
    private var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProduct()
        setupButton()
    }
    
    func setIdProduct(_ idProduct: Int) {
        self.idProduct = idProduct
    }
    
    private func setupProduct() {
        guard let idProduct = idProduct else { return }
        productManagerApi.fetchProduct(idProduct: idProduct) { (product) in
            guard let product = product() else { return }
            self.product = product
            self.setupNavBar()
            self.setupProductDetais()
        }
    }
    
    private func setupNavBar() {
        navigationItem.title = product?.category.description
        self.navigationController?.navigationBar.backItem?.title = "Voltar"
    }
    
    private func setupButton() {
        reserveBt.layer.cornerRadius = 10
        reserveBt.clipsToBounds = true
    }
    
    private func setupProductDetais() {
        guard let product = product else { return }
        
        let fromPrice = "De " + String(format: "%.2f", arguments: [product.fromPrice])
        
        productIV.loadImage(withURL: product.urlImage)
        descriptionLb.text = product.name
        fromPriceLb.attributedText = fromPrice.setTrace()
        toPriceLb.text = "Por " + String(format: "%.2f", arguments: [product.toPrice])
        textDescriptionLb.text = product.name
        textTV.attributedText = product.description.htmlToString()
    }
    
    @IBAction func reserveClick(_ sender: Any) {
        
        reserveBt.isEnabled = false
        
        guard let idProduct = idProduct else {
            return
        }
        
        productManagerApi.fetchReserve(idProduct: idProduct) { (reserveResponse) in
            guard let response = reserveResponse() else { return }
            
            let success = response.result == "success"
            var message = "Produto reservado com sucesso"
            if !success {
                message = "Por favor, tente novamente!"
            }
            
            let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alertController.addAction(alertAction)
            self.present(alertController, animated: true)

            self.reserveBt.isEnabled = true
        }

    }
}
