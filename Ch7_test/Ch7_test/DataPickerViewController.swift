//
//  DataPickerViewController.swift
//  Ch7_test
//
//  Created by Yan on 10/30/16.
//  Copyright © 2016 Yan. All rights reserved.
//

import UIKit

class DataPickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let date = NSDate()
        datePicker.setDate(date as Date, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onButtonPressed(_ sender: AnyObject) {
        let date = datePicker.date
        let message = "The date and time selected is \(date)"
        let alert = UIAlertController (title: "Date and Time seleted",
                                       message: message,
                                       preferredStyle: .alert)
        
        
        /*let alert = UIAlertController(title: "Blue View Button Pressed",
                                      message: "You pressed the button on the blue view \(date)",
                                      preferredStyle: .alert) */
        let action = UIAlertAction(
            title: "That's so true!",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }

}
