//
//  DetailController.swift
//  Prog3yzy0050Fa16
//
//  Created by Yan on 11/10/16.
//  Copyright © 2016 Yan. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    var autoInfo: [String] = []

    @IBOutlet weak var textYear: UILabel!
    @IBOutlet weak var textMake: UILabel!
    @IBOutlet weak var textModel: UILabel!
    @IBOutlet weak var textCondition: UILabel!
    @IBOutlet weak var textComments: UILabel!
    @IBOutlet weak var buttonCancel: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isTranslucent = false
        
        textYear.text = autoInfo[0]
        textMake.text = autoInfo[1]
        textModel.text = autoInfo[2]
        textCondition.text = autoInfo[3]
        textComments.text = autoInfo[4]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancelPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
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
