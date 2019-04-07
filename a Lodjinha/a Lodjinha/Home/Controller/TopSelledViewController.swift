//
//  TopSelledViewController.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import UIKit

class TopSelledViewController: UIViewController {

    @IBOutlet weak var topSelledTV: UITableView!
    
    private var products: [Product]?
    private let productManagerApi = ProductManagerApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTopSelled()
    }
    
    private func setupTopSelled() {
        productManagerApi.fetchTopSelled { (products) in
            self.products = products()?.data
            self.topSelledTV.reloadData()
            self.topSelledTV.delegate = self
            self.topSelledTV.dataSource = self
        }
    }
}

extension TopSelledViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let product = products?[indexPath.item],
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopSelledTableViewCell") as? TopSelledTableViewCell else {
                return UITableViewCell()
        }
        
        cell.setupProduct(product)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let product = products?[indexPath.row],
            let vc = storyBoard.instantiateViewController(withIdentifier:"ProductsDetailsViewController") as? ProductsDetailsViewController else { return }
        vc.setProduct(product)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
