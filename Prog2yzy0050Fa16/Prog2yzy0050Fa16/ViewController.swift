//
//  ViewController.swift
//  Prog2yzy0050Fa16
//
//  Created by Yan on 9/30/16.
//  Copyright © 2016 Yan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loanAmtField: UITextField!
    @IBOutlet weak var numberPaymentsField: UITextField!
    @IBOutlet weak var interestRateField: UITextField!
    @IBOutlet weak var ballonPaymentField: UITextField!
    @IBOutlet weak var paymentAmountField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func calculatePayment(_ sender: UIButton) {

        var loanAmt: Double
        var numberPayment: Int
        var interestRate: Double
        var ballonPayment: Double
        var alert: UIAlertController
         /*
        print("loadAmt: \(loanAmt)")
        if loanAmt < 5 {
            print("in if")
            var alert = UIAlertController(title: "Invalid input", message: "ok", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "hehe", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        let payment = Double(loanAmtField.text!)! + Double(numberPaymentsField.text!)! + Double(interestRateField.text!)! + Double(ballonPaymentField.text!)!
        
        paymentAmountField.text = String(payment)*/
        
        if loanAmtField.text?.isEmpty == true ||
           numberPaymentsField.text?.isEmpty == true ||
           interestRateField.text?.isEmpty == true {
            
            alert = UIAlertController(title: "Invalid input", message: "Inputs should not be empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            loanAmt = Double(loanAmtField.text!)!
            numberPayment = Int(numberPaymentsField.text!)!
            interestRate = Double(interestRateField.text!)! / 100
            
            if ballonPaymentField.text?.isEmpty == true {
                ballonPayment = 0
            } else {
                ballonPayment = Double(ballonPaymentField.text!)!
            }
            
            if loanAmt < 0 {
                
                alert = UIAlertController(title: "Invalid input", message: "Loan Amount must be a positive number", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            } else if numberPayment < 0 || numberPayment > 100 {
                
                alert = UIAlertController(title: "Invalid input", message: "# payments must be within 0 and 100", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            } else if interestRate <= 0 {
                
                alert = UIAlertController(title: "Invalid input", message: "Interest rate must be a positive number", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            } else if ballonPayment > loanAmt {
                
                alert = UIAlertController(title: "Invalid input", message: "Ballon payment must be less than or equal to loan amount", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            } else { //this is actual calculation
                
                let monthlyRate: Double = interestRate / 12
                
                let monthlyPayment: Double = (loanAmt * pow((1 + monthlyRate), Double(numberPayment)) - ballonPayment) * monthlyRate / (pow(1 + monthlyRate, Double(numberPayment)) - 1)
                //print("monthly: \(monthlyPayment)")
                let payment: String = String(format: "%.2f", monthlyPayment)
                
                paymentAmountField.text = payment
                
            }
        }
        
        
        onTapGestureRecognized(UIButton.self)
    }

    @IBAction func onTapGestureRecognized(_ sender: AnyObject) {
        loanAmtField.resignFirstResponder()
        numberPaymentsField.resignFirstResponder()
        interestRateField.resignFirstResponder()
        ballonPaymentField.resignFirstResponder()
    }
}

