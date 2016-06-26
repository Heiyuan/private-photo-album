//
//  ViewController.swift
//  PrivatePhotoAlbum
//
//  Created by 陶玉程 on 16/6/16.
//  Copyright © 2016年 Yuc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton.init(type: UIButtonType.Custom)
        button.backgroundColor = UIColor.redColor();
        button.frame = CGRectMake(0, 0, 100, 100);
        self.view.addSubview(button);
        button .addTarget(self, action: #selector(show), forControlEvents: UIControlEvents.TouchUpInside);
    }
    func show() -> Void {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

