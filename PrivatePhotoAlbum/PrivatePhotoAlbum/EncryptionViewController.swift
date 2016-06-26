//
//  EncryptionViewController.swift
//  PrivatePhotoAlbum
//
//  Created by 刘志远 on 16/6/25.
//  Copyright © 2016年 Yuc. All rights reserved.
//

import UIKit
import pop

class EncryptionViewController: UIViewController,UITextFieldDelegate {
    var animationStoped: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let textfileld = UITextField(frame: CGRectMake(100, 100, 200, 30));
        textfileld.borderStyle = UITextBorderStyle.RoundedRect
        textfileld.returnKeyType = UIReturnKeyType.Go
        textfileld.secureTextEntry = true
        textfileld.becomeFirstResponder()
        textfileld.delegate = self
        self.view.addSubview(textfileld)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.text == "111" {
            textField.resignFirstResponder()
            let tmpDelegate = UIApplication.sharedApplication().delegate
            tmpDelegate?.window!!.makeKeyAndVisible()
            return true
        } else {
            if animationStoped == true{
                textField.pop_removeAllAnimations()
                animationStoped = false
                let animation = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
                animation.fromValue = textField.layer.position.x
                animation.toValue = textField.layer.position.x + 20
                animation.springBounciness = 12
                animation.velocity = 2000
                dispatch_after(4, dispatch_get_main_queue(), {
                    self.animationStoped = true
                })
                textField.pop_addAnimation(animation, forKey: nil)
            }
            return false
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
