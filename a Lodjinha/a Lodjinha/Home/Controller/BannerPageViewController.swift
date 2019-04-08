//
//  BannerPageViewController.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import UIKit

class BannerPageViewController: UIPageViewController {

    private let bannerManagerApi = BannerManagerApi()
    private var banners: [Banner]?
    private var bannersController: [UIViewController] = []
    private var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBanner()
    }
    
    private func setupBanner() {
        bannerManagerApi.fetchBanners { (banners) in
            self.banners = banners()?.data
            self.setupPageController()
            self.delegate = self
            self.dataSource = self
        }
    }
    
    private func setupPageController() {
        banners?.forEach({ (banner) in
            bannersController.append(getViewController(withIdentifier: "BannerViewController", banner: banner))
        })
        
        if let bannersController = bannersController.first {
            setViewControllers([bannersController], direction: .forward, animated: true, completion: nil)
        }
        
        setupPageControl()
    }
    
    private func getViewController(withIdentifier identifier: String, banner: Banner) -> UIViewController {
        guard let bannerController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier:identifier) as? BannerViewController else {
                return UIViewController()
        }
        
        bannerController.loadBanner(banner)
        
        return bannerController
    }

}

extension BannerPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = bannersController.firstIndex(of: viewController) else { return nil }

        let previousIndex = index - 1
        guard previousIndex >= 0 else { return nil }
        guard bannersController.count > previousIndex else { return nil }
        
        return bannersController[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = bannersController.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = index + 1
        guard bannersController.count != nextIndex else { return nil }
        guard bannersController.count > nextIndex else { return nil }
        
        return bannersController[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let pageContentViewController = pageViewController.viewControllers?[0] else { return }
        self.pageControl.currentPage = bannersController.firstIndex(of: pageContentViewController) ?? 0
    }
}

extension BannerPageViewController {
    private func setupPageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0,
                                                  y: view.frame.maxY - 30,
                                                  width: view.frame.width,
                                                  height: 15))
        
        pageControl.tintColor = .white
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .white
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = banners?.count ?? 0
        
        view.addSubview(pageControl)
        view.bringSubviewToFront(pageControl)
    }
}
