//
//  SetPasswordViewController.swift
//  PrivatePhotoAlbum
//
//  Created by 刘志远 on 16/6/26.
//  Copyright © 2016年 Yuc. All rights reserved.
//

import UIKit
import Masonry
class SetPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let iconImageView:UIImageView = UIImageView(image: UIImage(named: "Icon"))
        self.view .addSubview(iconImageView);
        iconImageView 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
