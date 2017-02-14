//
//  ViewController.swift
//  ios-uikit-uipageviewcontroller-demo
//
//  Created by Kushida　Eiji on 2017/02/15.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
    
    private var pageViewController:UIPageViewController!
    private var dataSource = PageViewProvider()
    private var imageFiles = Photos.findAll()
    private var pageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    /// 該当ページへ移動する
    func scrollToPage(_ pageIndex: Int) {
        if let currentViewController = dataSource.viewControllerAtIndex(pageIndex) {
            
            if let pageViewController = pageViewController {
                pageViewController.setViewControllers([currentViewController],
                                                      direction: .forward, animated: false, completion: nil)
            }
        }
    }
    
    private func setup() {
        setupDataSource(imageFiles: imageFiles)
        setupPageView()
    }
    
    private func setupDataSource(imageFiles: [String]) {
        dataSource.setupImageFile(imageFiles: imageFiles)
    }
    
    /// ページビューを設定する
    private func setupPageView() {
        if let startingViewController = dataSource.viewControllerAtIndex(0) {
            
            pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                      navigationOrientation: .horizontal,
                                                      options: [UIPageViewControllerOptionInterPageSpacingKey : 20])
            
            if let pageViewController = pageViewController {
                pageViewController.dataSource = dataSource
                pageViewController.delegate = self
                pageViewController.setViewControllers([startingViewController],
                                                      direction: .forward,
                                                      animated: false,
                                                      completion: {done in})
                pageViewController.view.frame = self.view.frame
                addChildViewController(pageViewController)
                self.view.addSubview(pageViewController.view)
            }
        }
    }
}

//MARK:-UIPageViewControllerDelegate
extension ViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        
        /// ページ番号を取得する
        if let vc = pageViewController.viewControllers?.first as? PageInnerViewController {
            print(vc.pageIndex)
        }
    }
}

