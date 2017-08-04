//
//  ViewController.swift
//  lottieAnimation
//
//  Created by Joseph Cassano on 7/27/17.
//  Copyright © 2017 Joseph Cassano. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBAction func startAnimation(_ sender: Any) {
        let animationView = LOTAnimationView(name: "data")
        animationView.frame = CGRect(x: 0, y: 10, width: view.frame.width, height: 50)
        animationView.contentMode = .scaleAspectFill
        self.view.addSubview(animationView)
        
        animationView.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

