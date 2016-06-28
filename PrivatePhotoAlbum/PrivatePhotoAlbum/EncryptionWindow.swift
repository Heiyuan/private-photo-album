//
//  EncryptionWindow.swift
//  PrivatePhotoAlbum
//
//  Created by 刘志远 on 16/6/25.
//  Copyright © 2016年 Yuc. All rights reserved.
//

import UIKit
import pop
private let effectView = UIVisualEffectView(frame: BOUNDS) /**<毛玻璃*/

class EncryptionWindow: UIWindow {
    
    static let sharedMySingleton = EncryptionWindow(frame:(UIScreen.mainScreen().bounds))
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.backgroundColor = UIColor.clearColor()
        let visualEffect = UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
        effectView.effect = visualEffect
        self.addSubview(effectView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    internal func show() -> Void {
        self.makeKeyAndVisible()
        self.hidden = false;
        self.rootViewController = EncryptionViewController()
    }
    func showHidd() -> Void {
        let whiteViewAlphaAnimation = POPBasicAnimation(propertyNamed: kPOPViewAlpha)
        whiteViewAlphaAnimation.duration = 0.4
        whiteViewAlphaAnimation.toValue = 0
        whiteViewAlphaAnimation.completionBlock = {(_: POPAnimation!, finish: Bool!) in
            let tmpDelegate = UIApplication.sharedApplication().delegate
            tmpDelegate?.window!!.makeKeyAndVisible()
        }
        self.pop_addAnimation(whiteViewAlphaAnimation, forKey: "hidd")
    }
}
