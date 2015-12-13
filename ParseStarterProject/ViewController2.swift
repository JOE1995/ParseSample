//
//  ViewController2.swift
//  ParseStarterProject-Swift
//
//  Created by 矢吹祐真 on 2015/12/12.
//  Copyright © 2015年 Parse. All rights reserved.
//

import UIKit
import Parse

class ViewController2: UIViewController, UIPickerViewDelegate {

    //PickerViewで使う行の宣言
    var row:Int!
    
    // UIPickerViewを宣言
    var myUIPicker: UIPickerView!
    
    //Label"Player人数"
    var label:UILabel!
    
    // 表示する値の配列
    let myValues: NSArray = ["1班","２班","３班","４班","５班"]
    
    //選択した班
    var group:String! = "１班"
    
    //Parseからとってくるarea
    var area:String! = "null"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Controllerのタイトルを設定する.
        self.title = "確認"
        
        // Viewの背景色を定義する.
        self.view.backgroundColor = UIColor.greenColor()
        
        myUIPicker = UIPickerView()
        
        myUIPicker.layer.cornerRadius = 25
        
        // Delegateを設定する.
        myUIPicker.delegate = self
        
        // DataSourceを設定する.
        //myUIPicker.dataSource = self
        
        //背景色を設定
        let lightWhite = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        myUIPicker.backgroundColor = lightWhite
        
        // サイズを指定する
        myUIPicker.frame = CGRectMake(40,130,self.view.bounds.width-80, 170)
        label = UILabel(frame: CGRectMake(60, 450, self.view.bounds.width-120, 50))
        
        //ラベルを空にしておく
        label.text = ""
        
        //ラベルの背景色を設定
        label.backgroundColor = UIColor.whiteColor()
        
        //ラベルを角丸にする
        //label.layer.cornerRadius = 25
        
        // 角丸
        label.layer.masksToBounds = true
        
        // コーナーの半径
        label.layer.cornerRadius = 10.0
        
        // フォントサイズ
        label.font = UIFont.systemFontOfSize(25)
        
        // 文字を中央寄せ
        label.textAlignment = NSTextAlignment.Center
        
        // Viewに追加する.
        self.view.addSubview(myUIPicker)
        self.view.addSubview(label)
        
        
        // ボタンの定義をおこなう.
        let myButton = UIButton(frame: CGRectMake(0,0,100,50))
        myButton.backgroundColor = UIColor.orangeColor()
        myButton.layer.masksToBounds = true
        myButton.setTitle("確認", forState: .Normal)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:400)
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // ボタンをViewに追加する.
        self.view.addSubview(myButton);
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func retriveUsername(){
        
        let query = PFQuery(className:"hoge")
        query.whereKey("username", equalTo:group)
/*
        全情報が取り出される
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        //print(object.objectId)
                        print(object["area"])
                        print(object.createdAt!)
                        self.label.text = object["area"] as! String!
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
*/
        
        //最新の情報のみ取り出される
        query.getFirstObjectInBackgroundWithBlock {
            (object: PFObject?, error: NSError?) -> Void in
            if error != nil || object == nil {
                print("The getFirstObject request failed.")
            } else {
                // The find succeeded.
                print(object!["area"])
                print(object!.createdAt!)
                self.label.text = object!["area"] as! String!
                print("Successfully retrieved the object.")
            }
    }
        /*
        var query = PFQuery(className:"hoge")
        query.getObjectInBackgroundWithId("xWMyZEGZ") {
            (gameScore: PFObject?, error: NSError?) -> Void in
            if error == nil && gameScore != nil {
                print(gameScore)
            } else {
                print(error)
            }
        }
        */


    }
    
    /*
    pickerに表示する列数を返すデータソースメソッド.
    (実装必須)
    */
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /*
    pickerに表示する行数を返すデータソースメソッド.
    (実装必須)
    */
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myValues.count
    }
    
    /*
    pickerに表示する値を返すデリゲートメソッド.
    */
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myValues[row] as? String
    }
    
    /*
    pickerが選択された際に呼ばれるデリゲートメソッド.
    */
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        /*
        print("row: \(row)")
        print("value: \(myValues[row])")
        */
        
        group = myValues[row] as! String
        
    }


    internal func onClickMyButton(sender: UIButton){
        retriveUsername()
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
