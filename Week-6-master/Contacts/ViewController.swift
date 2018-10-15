//
//  ViewController.swift
//  HideKeyBoard
//
//  Created by cis290 on 9/24/18.
//  Copyright © 2018 Rock Valley College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //outlets
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var txtFirst: UITextField!
    @IBOutlet weak var txtLast: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    
    
    //actions
    @IBAction func btnBack(_ sender: UIButton) {
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
        
        txtFirst.becomeFirstResponder()
    }
    @IBAction func btnSave(_ sender: UIButton) {
        DismissKeyboard()
        if (txtFirst.text=="" || txtLast.text=="" || txtEmail.text=="" || txtAddress.text=="" || txtCity.text=="" || txtState.text=="" || txtPhone.text=="") {
            MsgBox("All fields required, please correct.")
        }
        else{
            if (txtView.text==""){
                txtView.text = "MyContacts \n"
            }
            //format text
            txtView.text = "\(txtView.text!) \n\(txtFirst.text!) \n\(txtLast.text!) \n\(txtEmail.text!) \n\(txtAddress.text!) \n\(txtCity.text!) \n\(txtState.text!) \n\(txtPhone.text!) \n"
            txtFirst.text = ""
            txtLast.text = ""
            txtEmail.text = ""
            txtAddress.text = ""
            txtCity.text = ""
            txtState.text = ""
            txtPhone.text = ""
            
            var scrollPoint:CGPoint
            scrollPoint = CGPoint (x:0, y:btnBack.frame.origin.y)
            ScrollView.setContentOffset(scrollPoint, animated: true)
        }
    }
    @IBAction func btnView(_ sender: UIButton) {
        DismissKeyboard()
        var scrollPoint:CGPoint
        scrollPoint = CGPoint (x:0, y:btnBack.frame.origin.y)
        ScrollView.setContentOffset(scrollPoint, animated: true)
    }
    
    func MsgBox (_ message:String){
        //Create Alert
        let alert = UIAlertView()
        alert.title = "Alert"
        alert.message = message
        alert.addButton(withTitle: "OK")
        alert.show()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtFirst.endEditing(true)
        txtLast.endEditing(true)
        txtEmail.endEditing(true)
    }
    
    @objc func DismissKeyboard() {
        txtFirst.endEditing(true)
        txtLast.endEditing(true)
        txtEmail.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    func textFieldDidBeginEditing(_ textField:UITextField) {
        var scrollPoint:CGPoint
        scrollPoint = CGPoint(x:0, y:textField.frame.origin.y)
        ScrollView.setContentOffset(scrollPoint, animated: true)
    }
    
    func textFieldDidEndEditing(_ textField:UITextField) {
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    func textViewDidBeginEditing(_ textField:UITextView) {
        var scrollPoint:CGPoint
        scrollPoint = CGPoint(x:0, y:textField.frame.origin.y)
        ScrollView.setContentOffset(scrollPoint, animated: true)
    }
    
    func textViewDidEndEditing(_ textField:UITextView) {
        ScrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(ViewController.DismissKeyboard))
        ScrollView.addGestureRecognizer(tap)
        let size: CGRect = UIScreen.main.bounds
        ScrollView.frame = CGRect(x:0, y:50, width:size.width, height:size.height)
        txtFirst.becomeFirstResponder()
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

