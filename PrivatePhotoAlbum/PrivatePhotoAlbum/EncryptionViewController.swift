//
//  EncryptionViewController.swift
//  PrivatePhotoAlbum
//
//  Created by 刘志远 on 16/6/25.
//  Copyright © 2016年 Yuc. All rights reserved.
//

import UIKit
import pop
import IQKeyboardManager

class EncryptionViewController: UIViewController,UITextFieldDelegate {
    private var animationStoped: Bool = true /**<记录抖动动画是否结束*/
    private var textfileld : UITextField? /**<密码输入框*/
    private var maskView : UIView? /**<底层视图，用来做动画*/
    private var whiteView : UIView? /**<一层纯色视图，用来遮挡底层视图*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IQKeyboardManager.sharedManager().enableAutoToolbar = false
        createSubViews()
    }
    
    private func createSubViews() {
        maskView = ViewController().view
        self.view.addSubview(maskView!)
        
        whiteView = UIView(frame: BOUNDS)
        whiteView!.backgroundColor = UIColor.init(white: 0.95, alpha: 1.0)
        self.view.addSubview(whiteView!)
        
        textfileld = UITextField(frame: CGRectMake(CGBOUNDS(60), CGHBOUNDS(200), kWIDTH - CGBOUNDS(60) * 2, 30));
        textfileld!.borderStyle = UITextBorderStyle.RoundedRect
        textfileld!.returnKeyType = UIReturnKeyType.Go
        textfileld!.secureTextEntry = true
        textfileld!.becomeFirstResponder()
        textfileld!.delegate = self
        whiteView!.addSubview(textfileld!)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.text == "111" {
            textField.resignFirstResponder()
            hide()
            return true
        } else {
            if self.animationStoped {
                textField.pop_removeAllAnimations()
                self.animationStoped = false
                let animation = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
                animation.springBounciness = 12
                animation.velocity = 2000
                animation.completionBlock = {(_:POPAnimation!, finish:Bool!) in
                    self.animationStoped = true
                }
                textField.pop_addAnimation(animation, forKey: nil)
            }
            return false
        }
    }
    
    private func hide() {
        textfileld!.resignFirstResponder()
        let whiteViewAlphaAnimation = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
        whiteViewAlphaAnimation.duration = 0.4
        whiteViewAlphaAnimation.toValue = 0
        whiteViewAlphaAnimation.completionBlock = {(_:POPAnimation!, finish:Bool!) in
            let tmpDelegate = UIApplication.sharedApplication().delegate
            tmpDelegate?.window!!.makeKeyAndVisible()
        }
        whiteView!.pop_addAnimation(whiteViewAlphaAnimation, forKey: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
