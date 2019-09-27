//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Maitoparta on 2019/09/25.
//  Copyright © 2019 paruobro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    let images = [UIImage(named: "gaikan.jpg"), UIImage(named: "tennai1.jpg"), UIImage(named: "tennai2.jpg")]
    
    var imageIndex = 0
    
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        }
        
    @IBAction func next(_ sender: Any) {
        if self.timer != nil {
        } else if imageIndex < 1 {
            imageIndex += 1
        } else if imageIndex < 2 {
            imageIndex += 1
        } else if imageIndex < 3 {
            imageIndex -= 2
        }
         imageView.image = images[imageIndex]
    }
    
    @IBAction func back(_ sender: Any) {
        if self.timer != nil {
        } else if imageIndex == 0 {
            imageIndex = 2
        } else  {
            imageIndex -= 1
        }
        imageView.image = images[imageIndex]
    }
    
    @IBAction func startstop(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }else {
             timer.invalidate()
            self.timer = nil
            }
    }
    
        @objc func updateTimer(_ timer: Timer) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView.image = images[imageIndex]
    }
    
    @IBAction func unwind(_ segue: UIStoryboard){
        
    }
    
    @IBAction func onTapImage(_ sender: Any) {
        self.performSegue(withIdentifier: "Second", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let second = segue.destination as? SecondViewController
        SecondViewController.image1 = UIImage(named: "geaikan.jpg")
        SecondViewController.image2 = UIImage(named: "tennai1.jpg")
        SecondViewController.image3 = UIImage(named: "tennai2.jpg")

    }
    
    
}
