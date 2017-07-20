//
//  ViewController.swift
//  custom-paging
//
//  Created by Joseph Cassano on 7/20/17.
//  Copyright © 2017 Joseph Cassano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageIndicator: UIStackView!
    var pageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        pageIndicator.arrangedSubviews[0].backgroundColor = UIColor.red
        let pages = createPages()
        setupScrollView(pages: pages)
    }
    
    func createPages() -> [PageView] {
        let firstPage = Bundle.main.loadNibNamed("PageView", owner: self, options: nil)?.first as! PageView
        firstPage.backgroundColor = UIColor.gray
        let secondPage = Bundle.main.loadNibNamed("PageView", owner: self, options: nil)?.first as! PageView
        secondPage.backgroundColor = UIColor.black
        return [firstPage, secondPage]
    }
    
    func setupScrollView(pages:[PageView]) {
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(pages.count), height: view.frame.height)
        
        for i in 0 ..< pages.count {
            pages[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(pages[i])
        }
    }
}

extension ViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageIndicator.arrangedSubviews[pageIndex].backgroundColor = UIColor.white
        pageIndex = Int(round(scrollView.contentOffset.x / view.frame.width))
        pageIndicator.arrangedSubviews[pageIndex].backgroundColor = UIColor.red
    }
}

