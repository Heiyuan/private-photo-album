//
//  AppDelegate.swift
//  PrivatePhotoAlbum
//
//  Created by 陶玉程 on 16/6/16.
//  Copyright © 2016年 Yuc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var didFinshLuanch: Bool = false

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        
    }

    func applicationDidEnterBackground(application: UIApplication) {
        EncryptionWindow.sharedMySingleton.show()
    }

    func applicationWillEnterForeground(application: UIApplication) {
        (EncryptionWindow.sharedMySingleton.rootViewController as! EncryptionViewController).textFieldBecomeFirstResponder()
    }

    func applicationDidBecomeActive(application: UIApplication) {
        if !didFinshLuanch {
            EncryptionWindow.sharedMySingleton.show()
            didFinshLuanch = true
            (EncryptionWindow.sharedMySingleton.rootViewController as! EncryptionViewController).textFieldBecomeFirstResponder()
        }
    }

    func applicationWillTerminate(application: UIApplication) {
        
    }


}

