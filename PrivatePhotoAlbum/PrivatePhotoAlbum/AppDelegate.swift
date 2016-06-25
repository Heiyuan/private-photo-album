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


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        EncryptionWindow.sharedMySingleton.show()
    }

    func applicationDidEnterBackground(application: UIApplication) {
    
    }

    func applicationWillEnterForeground(application: UIApplication) {
        
    }

    func applicationDidBecomeActive(application: UIApplication) {
        EncryptionWindow.sharedMySingleton.show()
    }

    func applicationWillTerminate(application: UIApplication) {
        
    }


}

