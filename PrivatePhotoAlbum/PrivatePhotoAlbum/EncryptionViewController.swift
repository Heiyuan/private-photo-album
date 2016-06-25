//
//  EncryptionViewController.swift
//  PrivatePhotoAlbum
//
//  Created by 刘志远 on 16/6/25.
//  Copyright © 2016年 Yuc. All rights reserved.
//

import UIKit

let BOUNDS : CGRect = UIScreen.mainScreen().bounds
let kWIDTH : CGFloat = BOUNDS.size.width
let kHEIGHT : CGFloat = BOUNDS.size.height
let kSCALEX : CGFloat = kWIDTH / 375.0
let kSCALEY : CGFloat = kHEIGHT / 667.0

func CGBOUNDS(length:CGFloat) -> CGFloat {
    return length * kSCALEX
}

func CGHBOUNDS(length:CGFloat) -> CGFloat {
    return length * kSCALEY
}

class EncryptionViewController: UIViewController,UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSubViews()
    }
    
    func createSubViews() {
        let textfileld = UITextField(frame: CGRectMake(CGBOUNDS(80), 200, kWIDTH - CGBOUNDS(80) * 2, 30));
        textfileld.borderStyle = UITextBorderStyle.RoundedRect
        textfileld.returnKeyType = UIReturnKeyType.Go
        textfileld.secureTextEntry = true
        textfileld.becomeFirstResponder()
        textfileld.delegate = self
        self.view.addSubview(textfileld)
    }
    
    //MARK:UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.text == "111" {
            textField.resignFirstResponder();
            let tmpDelegate = UIApplication.sharedApplication().delegate
            tmpDelegate?.window!!.makeKeyAndVisible()
            return true
        } else {
            let alertController = UIAlertController(title: "提示", message: "密码错误", preferredStyle: UIAlertControllerStyle.Alert)
            let action = UIAlertAction(title: "确定", style: UIAlertActionStyle.Destructive, handler: nil)
            alertController.addAction(action)
            self.presentViewController(alertController, animated: true, completion: nil)
            return false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
