//
//  EncryptionWindow.swift
//  PrivatePhotoAlbum
//
//  Created by 刘志远 on 16/6/25.
//  Copyright © 2016年 Yuc. All rights reserved.
//

import UIKit

class EncryptionWindow: UIWindow {
    
    static let sharedMySingleton = EncryptionWindow(frame:(UIScreen.mainScreen().bounds))
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.backgroundColor = UIColor.yellowColor();
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
        
    }
}
