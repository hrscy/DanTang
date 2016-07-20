//
//  YMBaseViewController.swift
//  LongLian369
//
//  Created by 杨蒙 on 16/7/2.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import SVProgressHUD
import FDFullscreenPopGesture

class YMBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.fd_prefersNavigationBarHidden = true
        view.backgroundColor = UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1.0)
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.Custom)
        SVProgressHUD.setMinimumDismissTimeInterval(1.0)
        SVProgressHUD.setBackgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5))
        SVProgressHUD.setForegroundColor(UIColor.whiteColor())        
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
