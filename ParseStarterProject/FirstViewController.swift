//
//  FirstViewController.swift
//  ParseStarterProject-Swift
//
//  Created by 矢吹祐真 on 2015/12/12.
//  Copyright © 2015年 Parse. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Controllerのタイトルを設定する.
        self.title = "Top"
        
        // Viewの背景色をCyanに設定する.
        self.view.backgroundColor = UIColor.cyanColor()
        
        // ボタンの定義をおこなう.
        let myButton = UIButton(frame: CGRectMake(0,0,100,50))
        myButton.backgroundColor = UIColor.orangeColor()
        myButton.layer.masksToBounds = true
        myButton.setTitle("発信", forState: .Normal)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:200)
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // ボタンをViewに追加する.
        self.view.addSubview(myButton);

    
        // ボタン2の定義をおこなう.
        let myButton2 = UIButton(frame: CGRectMake(0,0,100,50))
        myButton2.backgroundColor = UIColor.orangeColor()
        myButton2.layer.masksToBounds = true
        myButton2.setTitle("確認", forState: .Normal)
        myButton2.layer.cornerRadius = 20.0
        myButton2.layer.position = CGPoint(x: self.view.bounds.width/2, y:300)
        myButton2.addTarget(self, action: "onClickMyButton2:", forControlEvents: .TouchUpInside)
        
        // ボタン2をViewに追加する.
        self.view.addSubview(myButton2);

    }
    
    /*
    ボタンイベント
    */
    internal func onClickMyButton(sender: UIButton){
        
        // 移動先のViewを定義する.
        let nextViewController = ViewController()
        
        // SecondViewに移動する.
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    internal func onClickMyButton2(sender: UIButton){
        
        // 移動先のViewを定義する.
        let nextViewController = ViewController2()
        
        // SecondViewに移動する.
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
