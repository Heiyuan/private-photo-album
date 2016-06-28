//
//  YCTextField.swift
//  PrivatePhotoAlbum
//
//  Created by 陶玉程 on 16/6/28.
//  Copyright © 2016年 Yuc. All rights reserved.
//

import UIKit
import pop

//MARK:根据borderStyle定义左侧基础偏移量的枚举
enum YCTextFieldBorderStyleOffset : CGFloat {
    case BezelOrRoundRect = 8.5
    case Line = 3.5
    case None = 1.5
}

class YCTextField: UITextField {
    //MARK:属性及setter & getter
    private let floatLabel = UILabel() /**<浮动lebel*/
    private let bottomLine = UIView() /**<底部灰线*/
    private var textDidEdit: Bool = true /**<是否进行编辑*/
    private var floatLabelOriginFrame: CGRect? /**<浮动label原始frame*/
    var topOffSet: CGFloat = 20 /**<浮动lebel的frame.origin.y距顶部偏移量*/
    
    var borderStyleOffset: YCTextFieldBorderStyleOffset = YCTextFieldBorderStyleOffset.None {
        willSet {
            self.borderStyleOffset = newValue
            self.leftOffSet += 0
        }
    }
    
    var leftOffSet: CGFloat = 0 {
        willSet {
            self.leftOffSet = newValue
            floatLabel.frame = CGRectMake(newValue + self.borderStyleOffset.rawValue, floatLabel.frame.origin.y, floatLabel.frame.size.width, floatLabel.frame.size.height)
            floatLabelOriginFrame = floatLabel.frame
        }
    }
    
    //MARK:重写父类属性
    override var placeholder: String? {
        set {
            super.placeholder = newValue
            floatLabel.text = newValue
        }
        get {
            return super.placeholder
        }
    }
    
    override var borderStyle: UITextBorderStyle {
        willSet {
            switch newValue {
            case .Line:
                super.borderStyle = newValue
                borderStyleOffset = YCTextFieldBorderStyleOffset.Line
                bottomLine.hidden = true
                break
            case .None:
                super.borderStyle = newValue
                borderStyleOffset = YCTextFieldBorderStyleOffset.None
                bottomLine.hidden = false
                break
            case .Bezel:
                fallthrough
            case .RoundedRect:
                super.borderStyle = newValue
                borderStyleOffset = YCTextFieldBorderStyleOffset.BezelOrRoundRect
                bottomLine.hidden = true
                break
            }
        }
    }
    
    //MARK:重写initWithFrame:
    override init(frame: CGRect) {
        super.init(frame: frame)
        commenInit()
    }
    
    //MARK:定制init
    private func commenInit() {
        self.layer.masksToBounds = false
        floatLabel.alpha = 0
        floatLabel.font = UIFont.boldSystemFontOfSize(12)
        floatLabel.frame = CGRectMake(leftOffSet, -12, self.frame.size.width, 12)
        floatLabelOriginFrame = floatLabel.frame
        floatLabel.textColor = UIColor(red: 38 / 255.0, green: 107 / 255.0, blue: 243 / 255.0, alpha: 1.0)
        self.addSubview(floatLabel)
        
        bottomLine.backgroundColor = UIColor.init(white: 0.8, alpha: 1.0)
        bottomLine.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, 1)
        self.addSubview(bottomLine)
        
        self.addTarget(self, action: #selector(textDidChange), forControlEvents: UIControlEvents.EditingChanged)
        self.addTarget(self, action: #selector(textDidBegin), forControlEvents: UIControlEvents.EditingDidBegin)
        self.addTarget(self, action: #selector(textDidEnd), forControlEvents: UIControlEvents.EditingDidEnd)
    }
    
    //MARK:判断输入内容变化
    @objc private func textDidChange() {
        let textString: NSString = NSString(string: self.text!)
        if textString.length == 1 && self.textDidEdit {
            textBeginEditFromNil()
        } else if textString.length == 0 {
            textDidClear()
        } else {
            self.textDidEdit = false
        }

    }
    
    //MARK:编辑结束，label字体颜色变灰
    @objc private func textDidEnd() {
        let textColorAnimation = POPBasicAnimation(propertyNamed: kPOPLabelTextColor)
        textColorAnimation.toValue = UIColor.init(white: 0.8, alpha: 1.0)
        textColorAnimation.duration = 0.3
        floatLabel.pop_addAnimation(textColorAnimation, forKey: nil)
    }
    
    //MARK:编辑开始，label字体颜色变蓝
    @objc private func textDidBegin() {
        floatLabel.textColor = UIColor(red: 38 / 255.0, green: 107 / 255.0, blue: 243 / 255.0, alpha: 1.0)
    }
    
    //MARK:文本内容从无到有
    private func textBeginEditFromNil() {
        let toValueFrame = CGRectMake(floatLabelOriginFrame!.origin.x, -topOffSet, floatLabelOriginFrame!.size.width, floatLabelOriginFrame!.size.height)
        let alphaAnimation  = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
        alphaAnimation.duration = 0.4
        alphaAnimation.toValue = 1
        floatLabel.pop_addAnimation(alphaAnimation, forKey: nil)
        
        let frameAnimation = POPBasicAnimation(propertyNamed: kPOPViewFrame)
        frameAnimation.duration = 0.4
        frameAnimation.toValue = NSValue(CGRect: toValueFrame)
        floatLabel.pop_addAnimation(frameAnimation, forKey: nil)
    }
    
    //MARK:文本内容清空
    func textDidClear() {
        self.textDidEdit = true
        let alphaAnimation  = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
        alphaAnimation.duration = 0.4
        alphaAnimation.toValue = 0
        alphaAnimation.completionBlock = {(animation: POPAnimation!, finish: Bool!) in
            self.floatLabel.frame = self.floatLabelOriginFrame!
        }
        floatLabel.pop_addAnimation(alphaAnimation, forKey: nil)
    }
    
    //MARK:编译器自己加的，我也不懂它要干啥
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
