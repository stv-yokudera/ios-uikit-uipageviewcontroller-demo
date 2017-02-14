//
//  PageInnerViewController.swift
//  ios-uikit-uipageviewcontroller-demo
//
//  Created by Kushida　Eiji on 2017/02/15.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit


final class PageInnerViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var pageIndex = 0
    var filePath = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupImageView(filePath: filePath)
    }
    
    private func setup() {
        setupImageView(filePath: filePath)
    }
    
    private func setupImageView(filePath: String) {
        imageView.image = UIImage(named: filePath)
    }
}
