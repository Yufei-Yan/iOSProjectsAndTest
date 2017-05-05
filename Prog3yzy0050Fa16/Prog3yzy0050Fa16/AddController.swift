//
//  AddController.swift
//  Prog3yzy0050Fa16
//
//  Created by Yan on 11/10/16.
//  Copyright © 2016 Yan. All rights reserved.
//

import UIKit

class AddController: UIViewController {


    @IBOutlet weak var textYear: UITextField!
    @IBOutlet weak var textMake: UITextField!
    @IBOutlet weak var textModel: UITextField!
    @IBOutlet weak var textCondition: UITextField!
    @IBOutlet weak var textComment: UITextField!
    
    @IBOutlet weak var buttonSave: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        textYear.text = "2016"
        textMake.text = "New Car"
        textModel.text = "New Model"
        textCondition.text = "5"
        textComment.text = "-"
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addCancel" {
            let listVC = segue.destination as! RootViewController
            
            listVC.isAppend = true
            listVC.addAuto = ["2016", "New Car", "New Model", "5", "-"]
        } else if segue.identifier == "addSave" {
            let listVC = segue.destination as! RootViewController
            
            listVC.isAppend = true
            listVC.addAuto = ["\(textYear.text!)", "\(textMake.text!)", "\(textModel.text!)", "\(textCondition.text!)", "\(textComment.text!)"]
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
