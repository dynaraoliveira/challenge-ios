//
//  CategoryViewController.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var categoriesCV: UICollectionView!
    
    private var categories: [Category]?
    private let categoryManagerApi = CategoryManagerApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCategory()
    }
    
    private func setupCategory() {
        categoryManagerApi.fetchCategories { (categories) in
            self.categories = categories()?.data
            self.categoriesCV.reloadData()
            self.categoriesCV.delegate = self
            self.categoriesCV.dataSource = self
        }
    }

}

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let category = categories?[indexPath.item],
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
        }
        
        cell.setupCategory(category)
        
        return cell
    }
    
    
}
