//
//  PageViewProvider.swift
//  ios-uikit-uipageviewcontroller-demo
//
//  Created by Kushida　Eiji on 2017/02/15.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit

final class PageViewProvider: NSObject {
    
    var imageFiles: [String] = []
    
    func setupImageFile(imageFiles: [String]) {
        self.imageFiles = imageFiles
    }
    
    func viewControllerAtIndex(_ index: Int) -> PageInnerViewController? {
        
        if imageFiles.count == 0 || index >= imageFiles.count {
            return nil
        }
        if let vc = UIStoryboard.getViewController("Main", identifier: "PageInnerViewController") as? PageInnerViewController {
            vc.pageIndex = index
            vc.filePath = imageFiles[index]
            return vc
        }
        return nil
    }
}

// MARK: - UIPageViewControllerDataSource
extension PageViewProvider: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return goFowardPage(viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return goBackPage(viewController)
    }
    
    // MARK: - private methods
    
    private func goBackPage(_ viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! PageInnerViewController).pageIndex
        if index == NSNotFound {
            return nil
        }
        index -= 1
        
        // 前が無い場合は、最後のページへ
        if index == -1 {
            index = imageFiles.count - 1
        }
        return viewControllerAtIndex(index)
    }
    
    private func goFowardPage(_ viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! PageInnerViewController).pageIndex
        if index == NSNotFound {
            return nil;
        }
        index += 1
        
        // 次が無い場合は、最初のページへ
        if index == imageFiles.count {
            index = 0
        }
        return self.viewControllerAtIndex(index)
    }
}
