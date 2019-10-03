//
//  CheckController.swift
//  PDCA
//
//  Created by 大嶋　涼 on 2019/07/05.
//  Copyright © 2019 大嶋　涼. All rights reserved.
//

import Foundation
import UIKit

class CheckController:  UIViewController , UITextFieldDelegate   {
    
    @IBOutlet weak var nicetext: UITextField!
    @IBOutlet weak var badtext: UITextField!
    @IBOutlet weak var noticed: UITextField!

    //      value
    var nice:String = "nice"
    var bad:String = "bad"
    var notice:String = "notice"
    //   UserDefaults のインスタンス
    let userDefaults = UserDefaults.standard


    override func viewDidLoad() {
        super.viewDidLoad()

       //   初期設定
        nicetext.delegate = self
        userDefaults.register(defaults: ["DataNice": "default"])
        badtext.delegate = self
        userDefaults.register(defaults: ["DataBad": "default"])
        noticed.delegate = self
        userDefaults.register(defaults: ["DataNoticed": "default"])

//        nicetext.text = readDataNice()
//        badtext.text = readDataBad()
//        noticed.text = readDataNoticed()

       //  Do any additional setup after loading the view, typically from a nib.
    }


    // Keyを指定して読み込み
    func readDataNice() -> String {
        let str: String = userDefaults.object(forKey: "DataNice") as! String
        return str
    }
    func readDataBad() -> String {
        let str: String = userDefaults.object(forKey: "DataBad") as! String
        return str
    }
    func readDataNoticed() -> String {
        let str: String = userDefaults.object(forKey: "DataNoticed") as! String
        return str
    }


    //  キーボードを閉じる
    func textFieldShouldReturn(_ nicetext: UITextField) -> Bool{
        nice = nicetext.text!          //入力からの読み取り
        nicetext.text = nice
        nicetext.resignFirstResponder()
      //  saveData()
        return true
    }
//    func badtextFieldShouldReturn(_ badtext: UITextField) -> Bool{
//        bad = badtext.text!          //入力からの読み取り
//        badtext.text = bad
//        badtext.resignFirstResponder()
//        return true
//    }
//    func noticedtextFieldShouldReturn(_ noticed: UITextField) -> Bool{
//        notice = noticed.text!          //入力からの読み取り
//        noticed.text = notice
//        noticed.resignFirstResponder()
//        return true
//    }
    
    
    func saveData() {
            userDefaults.set(nicetext.text, forKey: "DataNice")
            userDefaults.set(badtext.text, forKey: "DataBad")
            userDefaults.set(noticed.text, forKey: "DataNoticed")
    
            userDefaults.synchronize()          //同期
       
        }
    
    
    


//    // Keyを指定して読み込み
    
    @IBAction func saveData(_ sender: Any) {
        userDefaults.set(nicetext.text, forKey: "DataNice")
        userDefaults.set(badtext.text, forKey: "DataBad")
        userDefaults.set(noticed.text, forKey: "DataNoticed")
        
        userDefaults.synchronize()          //同期
        print("save")
        print(userDefaults.object(forKey: "DataNice") as! String)
        print(userDefaults.object(forKey: "DataBad") as! String)
        print(userDefaults.object(forKey: "DataNoticed") as! String)

    }
    
    
    
}
