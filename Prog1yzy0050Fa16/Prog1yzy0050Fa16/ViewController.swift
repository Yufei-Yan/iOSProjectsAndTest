//
//  ViewController.swift
//  Prog1yzy0050Fa16
//
//  Created by Yan on 9/5/16.
//  Copyright © 2016 Yan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var imageView: UIImageView!
    @IBAction func buttonPressed(_ sender: UIButton) {
        let title = sender.currentTitle
        //uncomment to test only
        //print(title)
        
        if title == "War Eagle" {
            imageView.image = UIImage(named: "auburn")
        } else if title == "Roll Tide"{
            imageView.image = UIImage(named: "alabama")
        } else {
            imageView.image = UIImage(named: "sec_conference")
        }
        
    }

}

