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

class EncryptionViewController: UIViewController, UITextFieldDelegate {
    private var maskView: UIView? /**<底层视图，用来做动画*/
    private let effectView = UIVisualEffectView(frame: BOUNDS) /**<毛玻璃*/
    private let iconImageView = UIImageView() /**<App图标*/
    private var placeHolderLabel = UILabel() /**<浮动Label*/
    private var textfileld = UITextField() /**<密码输入框*/
    private var animationStoped: Bool = true /**<记录抖动动画是否结束*/
    private var textDidEdit: Bool = true /**<判断输入框内容是否从nil开始编辑*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IQKeyboardManager.sharedManager().enableAutoToolbar = false
        IQKeyboardManager.sharedManager().enable = true
        createSubViews()
    }
    
    //MARK: 自定义方法
    /**
     创建子视图
     */
    private func createSubViews() {
        maskView = ViewController().view
        self.view.addSubview(maskView!)
        
        let visualEffect = UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
        effectView.effect = visualEffect
        self.view.addSubview(effectView)
        
        iconImageView.image = UIImage(named: "Icon-60@3x")
        iconImageView.frame = CGRectMake((kWIDTH - CGBOUNDS(90)) / 2, CGBOUNDS(150) - 20, CGBOUNDS(90), CGBOUNDS(90))
        effectView.addSubview(iconImageView)
        
        placeHolderLabel.frame = CGRectMake(CGBOUNDS(60) + 8, CGBOUNDS(260) - 20, 200, 30)
        placeHolderLabel.textColor = UIColor(red: 38 / 255.0, green: 107 / 255.0, blue: 243 / 255.0, alpha: 1.0)
        placeHolderLabel.font = UIFont.boldSystemFontOfSize(12)
        placeHolderLabel.text = "Password"
        placeHolderLabel.alpha = 0
        effectView.addSubview(placeHolderLabel)
        
        textfileld = UITextField(frame: CGRectMake(CGBOUNDS(60), CGHBOUNDS(260), kWIDTH - CGBOUNDS(60) * 2, 30));
        textfileld.addTarget(self, action: #selector(textDidChange), forControlEvents: UIControlEvents.EditingChanged)
        textfileld.keyboardAppearance = UIKeyboardAppearance.Default
        textfileld.borderStyle = UITextBorderStyle.RoundedRect
        textfileld.returnKeyType = UIReturnKeyType.Go
        textfileld.placeholder = "Password"
        textfileld.secureTextEntry = true
        textfileld.becomeFirstResponder()
        textfileld.delegate = self
        effectView.addSubview(textfileld)
    }
   
    /**
     密码输入正确，隐藏window视图
     */
    @objc private func hideForCorrect() {
        textfileld.resignFirstResponder()
        let whiteViewAlphaAnimation = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
        whiteViewAlphaAnimation.duration = 0.6
        whiteViewAlphaAnimation.toValue = 0
        whiteViewAlphaAnimation.completionBlock = {(_: POPAnimation!, finish: Bool!) in
            let tmpDelegate = UIApplication.sharedApplication().delegate
            tmpDelegate?.window!!.makeKeyAndVisible()
        }
        effectView.pop_addAnimation(whiteViewAlphaAnimation, forKey: nil)
    }
    
    /**
     密码输入错误，输入框抖动
     */
    private func shakeForError() {
        self.animationStoped = false
        self.textfileld.text = nil
        textDidClear()
        let animation = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
        animation.springBounciness = 12
        animation.velocity = 2000
        animation.completionBlock = {(_: POPAnimation!, finish: Bool!) in
            self.animationStoped = true
        }
        self.textfileld.pop_addAnimation(animation, forKey: nil)
    }
    
    /**
     文本从空开始编辑时调用（做Label渐显上升动画）
     */
    private func textBeginEditFromNil() {
        let alphaAnimation  = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
        alphaAnimation.duration = 0.4
        alphaAnimation.toValue = 1
        placeHolderLabel.pop_addAnimation(alphaAnimation, forKey: nil)
        
        let frameAnimation = POPBasicAnimation(propertyNamed: kPOPViewFrame)
        frameAnimation.duration = 0.4
        frameAnimation.toValue = NSValue(CGRect: CGRectMake(CGBOUNDS(60) + 8, CGBOUNDS(260) - 30, 200, 30))
        placeHolderLabel.pop_addAnimation(frameAnimation, forKey: nil)
    }
    
    /**
     文本清空时调用
     */
    private func textDidClear() {
        self.textDidEdit = true
        let alphaAnimation  = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
        alphaAnimation.duration = 0.4
        alphaAnimation.toValue = 0
        alphaAnimation.completionBlock = {(animation: POPAnimation!, finish: Bool!) in
            self.placeHolderLabel.frame = CGRectMake(CGBOUNDS(60) + 8, CGBOUNDS(260) - 20, 200, 30)
        }
        placeHolderLabel.pop_addAnimation(alphaAnimation, forKey: nil)
    }
    
    /**
     输入框内容变化时调用
     */
    @objc private func textDidChange() {
        let textString: NSString = NSString(string: textfileld.text!)
        if textString.length == 1 && self.textDidEdit{
            textBeginEditFromNil()
        } else if textString.length == 0 {
            textDidClear()
        } else {
            self.textDidEdit = false
        }
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.text == "111" {
            textField.resignFirstResponder()
            hideForCorrect()
            return true
        } else {
            if self.animationStoped {
                shakeForError()
            }
            return false
        }
    }
    
    //MARK: 重写允许横屏方法
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
