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

    func show() {
        let alertVC = UIAlertController(title: "添加文件夹", message: "输入名称", preferredStyle: UIAlertControllerStyle.Alert)
        alertVC.addTextFieldWithConfigurationHandler(nil)
        let alertActionCancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        let alertActionDestructive = UIAlertAction(title: "添加", style: UIAlertActionStyle.Default) { (_) in
            if (alertVC.textFields?.first as UITextField!).text?.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) == 0 {
                print("文件夹名称不能为空")
            } else {
                print("添加成功")
            }
        }
        alertVC.addAction(alertActionCancel)
        alertVC.addAction(alertActionDestructive)
        self.presentViewController(alertVC, animated: true) { 
            for subView in alertVC.view.subviews {
                for subView2 in subView.subviews {
                    for subView3 in subView2.subviews {
                        for subView4 in subView3.subviews {
                            for subView5 in subView4.subviews {
                                for subView6 in subView5.subviews {
                                    for subView7 in subView6.subviews {
                                        for subView8 in subView7.subviews {
                                            for subView9 in subView8.subviews {
                                                for subView10 in subView9.subviews {
                                                    for subView11 in subView10.subviews {
                                                        for subView12 in subView11.subviews {
                                                            for subView13 in subView12.subviews {
                                                                (subView13 as UIView!).layer.cornerRadius = 5
                                                                (subView13 as UIView!).layer.masksToBounds = true
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

