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
    private let iconImageView = UIImageView() /**<App图标*/
    private var placeHolderLabel = UILabel() /**<浮动Label*/
    private var textfileld: YCTextField? /**<密码输入框*/
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
        iconImageView.image = UIImage(named: "Icon-60@3x")
        iconImageView.frame = CGRectMake((kWIDTH - CGBOUNDS(90)) / 2, CGBOUNDS(150) - 20, CGBOUNDS(90), CGBOUNDS(90))
        self.view.addSubview(iconImageView)
        
        textfileld = YCTextField(frame: CGRectMake(CGBOUNDS(60), CGHBOUNDS(260), kWIDTH - CGBOUNDS(60) * 2, 30));
        textfileld!.clearButtonMode = UITextFieldViewMode.WhileEditing
        textfileld!.borderStyle = UITextBorderStyle.RoundedRect
        textfileld!.returnKeyType = UIReturnKeyType.Go
        textfileld!.placeholder = "Password"
        textfileld!.secureTextEntry = true
        textfileld!.delegate = self
        self.view.addSubview(textfileld!)
    }
   
    /**
     密码输入正确，隐藏window视图
     */
    @objc private func hideForCorrect() {
        textfileld!.resignFirstResponder()
        let window =  self.view.window as! EncryptionWindow
        window.showHidd()
    }
    
    /**
     密码输入错误，输入框抖动
     */
    private func shakeForError() {
        self.animationStoped = false
        self.textfileld!.text = nil
        textfileld!.textDidClear()
        let animation = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
        animation.springBounciness = 12
        animation.velocity = 2000
        animation.completionBlock = {(_: POPAnimation!, finish: Bool!) in
            self.animationStoped = true
        }
        self.textfileld!.pop_addAnimation(animation, forKey: nil)
    }
    
    //MARK: 输入框成为第一响应者
    func textFieldBecomeFirstResponder() {
        textfileld!.becomeFirstResponder()
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
