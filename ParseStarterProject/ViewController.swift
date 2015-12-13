/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate {
    
    //UITextFieldの宣言
    var myTextField: UITextField!
    
    //PickerViewで使う行の宣言
    var row:Int!
    
    //UIPickerViewを宣言
    var myUIPicker: UIPickerView!
    
    //表示する値の配列
    let myValues: NSArray = ["１班","２班","３班","４班","５班"]
    
    //選択した班
    var group:String! = "１班"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Controllerのタイトルを設定する.
        self.title = "発信"
        
        // Viewの背景色を定義する.
        self.view.backgroundColor = UIColor.greenColor()
        
        // UITextFieldを作成する.
        myTextField = UITextField(frame: CGRectMake(0,0,200,30))
        
        // 表示する文字を代入する.
        myTextField.text = ""
        
        //placehoderに文字を入力
        myTextField.placeholder = "場所を入力"
        
        // Delegateを設定する.
        myTextField.delegate = self
        
        // 枠を表示する.
        myTextField.borderStyle = UITextBorderStyle.RoundedRect
        
        // UITextFieldの表示する位置を設定する.
        myTextField.layer.position = CGPoint(x:self.view.bounds.width/2,y:130);
        
        // Viewに追加する.
        self.view.addSubview(myTextField)
        
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
        myUIPicker.frame = CGRectMake(40,180,self.view.bounds.width-80, 100)
        
        
        // Viewに追加する.
        self.view.addSubview(myUIPicker)
        
        
        // ボタンの定義をおこなう.
        let myButton = UIButton(frame: CGRectMake(0,0,100,50))
        myButton.backgroundColor = UIColor.orangeColor()
        myButton.layer.masksToBounds = true
        myButton.setTitle("発信", forState: .Normal)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:400)
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // ボタンをViewに追加する.
        self.view.addSubview(myButton);

/*
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
*/
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveUsername(){
        //クラスをhogeに指定
        let hoge = PFObject(className:"hoge")
        //UserName.textをhogeクラスの中のusernameに入れる
        print(group)
        print(myTextField.text!)
        hoge["username"] = group
        hoge["area"] = myTextField.text
        hoge.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Save to username")
            print("Save to area")
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //AppDelegateのインスタンスを取得
            appDelegate.objectId01 = hoge.objectId//appDelegateの変数を操作
        }
    }
    
    func retriveUsername(){
        let query = PFQuery(className:"hoge")
        query.getObjectInBackgroundWithId("xWMyZEGZ") {
            (gameScore: PFObject?, error: NSError?) -> Void in
            if error == nil && gameScore != nil {
                print(gameScore)
            } else {
                print(error)
            }
        }
    }
    
    /*
    改行ボタンが押された際に呼ばれるデリゲートメソッド.
    */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
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
        saveUsername()
    }

    
}