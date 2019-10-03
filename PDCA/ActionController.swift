//
//  ActionController.swift
//  PDCA
//
//  Created by 大嶋　涼 on 2019/07/05.
//  Copyright © 2019 大嶋　涼. All rights reserved.
//

import Foundation
import UIKit


class ActionController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var button: UIButton!
    
    var text:String = "default"
    //   UserDefaults のインスタンス
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var value: UILabel!
    // textFiel の情報を受け取るための delegate を設定
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(userDefaults.object(forKey: "DataNice") as! String)
        print(userDefaults.object(forKey: "DataBad") as! String)
        print(userDefaults.object(forKey: "DataNoticed") as! String)
        // Do any additional setup after loading the view, typically from a nib.
        textField.delegate = self
        userDefaults.register(defaults: ["DataAction": "default"])
        userDefaults.register(defaults: ["Num": 0])
        
//        textField.text = readData()
       
    }
    
    func readData() -> String {
        let str: String = userDefaults.object(forKey: "DataAction") as! String
        return str
    }
    //  キーボードを閉じる
    func textFieldShouldReturn(_ nicetext: UITextField) -> Bool{
        text = textField.text!          //入力からの読み取り
        textField.text = text
        textField.resignFirstResponder()
        return true
    }
    
    
    //データ保存
    @IBAction func saveData(_ sender: Any) {
        
         userDefaults.set(text, forKey: "DataAction")
        userDefaults.synchronize()          //同期
        
        print(saveData)
        //登録するタイトル
        let title: String = userDefaults.object(forKey: "DataStore") as! String
        
        
        //中身
        var content: String = ""
        content += userDefaults.object(forKey: "DataNice") as! String + "/"
        content += userDefaults.object(forKey: "DataBad") as! String + "/"
        content += userDefaults.object(forKey: "DataNoticed") as! String + "/"
        content += userDefaults.object(forKey: "DataAction") as! String
        
        print(content)

        
        userDefaults.set(content, forKey: title)
        
        var Itemnum:Int = userDefaults.object(forKey: "Num") as! Int             //アイテムがなんばんめに登録されているか
        userDefaults.set(title, forKey: String(Itemnum))                                //登録
         userDefaults.set(Itemnum+1, forKey: "Num")                             //Itemnumの更新

        userDefaults.synchronize()
        print(content)
        print(Itemnum)


    }
   
}
