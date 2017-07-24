//
//  ViewController.swift
//  custom-paging
//
//  Created by Joseph Cassano on 7/20/17.
//  Copyright © 2017 Joseph Cassano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var indicator: UIView!
    @IBOutlet weak var currentPageXConstraint: NSLayoutConstraint!
    @IBOutlet weak var currentPage: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageIndicator: UIStackView!
    let indicatorWidth = 25
    var pageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        let pages = createPages()
        setupScrollView(pages: pages)
    }
    
    func createPages() -> [PageView] {
        let firstPage = Bundle.main.loadNibNamed("PageView", owner: self, options: nil)?.first as! PageView
        firstPage.backgroundColor = UIColor.gray
        let secondPage = Bundle.main.loadNibNamed("PageView", owner: self, options: nil)?.first as! PageView
        secondPage.backgroundColor = UIColor.black
        let thirdPage = Bundle.main.loadNibNamed("PageView", owner: self, options: nil)?.first as! PageView
        thirdPage.backgroundColor = UIColor.blue
        return [firstPage, secondPage, thirdPage]
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
        print(scrollView.contentOffset.x)
        
        let distanceBetweenIndicators = pageIndicator.arrangedSubviews[1].center.x - pageIndicator.arrangedSubviews[0].center.x
        var percentageToMove = scrollView.contentOffset.x / view.frame.width
        
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [],
                       animations: {self.currentPageXConstraint.constant = (self.pageIndicator.arrangedSubviews[0].frame.origin.x + distanceBetweenIndicators * percentageToMove)
                       self.view.layoutIfNeeded()
        })
        
        pageIndex = Int(round(scrollView.contentOffset.x / view.frame.width))
    }
}

