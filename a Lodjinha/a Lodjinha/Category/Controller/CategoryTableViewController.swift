//
//  CategoryTableViewController.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    private var products: [Product]?
    private let productManagerApi = ProductManagerApi()
    
    private var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    func setCategory(_ category: Category) {
        self.category = category
    }
    
    private func setupNavBar() {
        navigationItem.title = category?.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupProducts()
    }
    
    private func setupProducts() {
        guard let idCategory = category?.id else { return }
        productManagerApi.fetchProducts(idCategory: idCategory) { (products) in
            self.products = products()?.data
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let product = products?[indexPath.item],
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell else {
                return UITableViewCell()
        }
        
        cell.setupProduct(product)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let idProduct = products?[indexPath.row].id,
            let vc = storyBoard.instantiateViewController(withIdentifier:"ProductsDetailsViewController") as? ProductsDetailsViewController else { return }
        vc.setIdProduct(idProduct)
        navigationController?.pushViewController(vc, animated: true)
    }
}
