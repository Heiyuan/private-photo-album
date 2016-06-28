//
//  SetPasswordViewController.swift
//  PrivatePhotoAlbum
//
//  Created by 刘志远 on 16/6/26.
//  Copyright © 2016年 Yuc. All rights reserved.
//

import UIKit
class SetPasswordViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let iconImageView:UIImageView = UIImageView(image: UIImage(named: "Icon-60@3x"))
        iconImageView.translatesAutoresizingMaskIntoConstraints = false;
        self.view.addSubview(iconImageView)
        self.view.addConstraint(NSLayoutConstraint.init(item: iconImageView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint.init(item: iconImageView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 0.3, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint.init(item: iconImageView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 130));
       
    
    
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
