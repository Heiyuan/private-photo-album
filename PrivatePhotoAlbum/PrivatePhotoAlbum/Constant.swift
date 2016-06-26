//
//  Constant.swift
//  PrivatePhotoAlbum
//
//  Created by 陶玉程 on 16/6/26.
//  Copyright © 2016年 Yuc. All rights reserved.
//

import Foundation

let BOUNDS = UIScreen.mainScreen().bounds
let kWIDTH = BOUNDS.size.width
let kHEIGHT = BOUNDS.size.height
let kSCALEX = kWIDTH / 375.0
let kSCALEY = kHEIGHT / 667.0
let kSTATUSBARHEIGHT = 20.0


func CGBOUNDS(width:CGFloat) -> CGFloat {
    return width * kSCALEX
}

func CGHBOUNDS(height:CGFloat) -> CGFloat {
    return height * kSCALEY
}



        