//
//  PlanController.swift
//  PDCA
//
//  Created by 大嶋　涼 on 2019/07/05.
//  Copyright © 2019 大嶋　涼. All rights reserved.
//

import Foundation
import UIKit

class PlanController: UIViewController, UITextFieldDelegate  {
 
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    var testText:String = "default"

  //   UserDefaults のインスタンス
    let userDefaults = UserDefaults.standard

    // textFiel の情報を受け取るための delegate を設定
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        userDefaults.register(defaults: ["DataStore": "default"])
        //label.text = readData()
        
    }
    
    @IBAction func buttonTouch(_ sender: Any) {
        
        saveData(str: testText)
    }
    
    
    func readData() -> String {
        // Keyを指定して読み込み
        let str: String = userDefaults.object(forKey: "DataStore") as! String

        return str
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{

        testText = textField.text!          //入力からの読み取り
        label.text = testText
        // キーボードを閉じる
        textField.resignFirstResponder()
        saveData(str: testText)

        return true
        
    }
    
    
    func saveData(str: String){

        print("save")
        print(str)
        // Keyを指定して保存
        userDefaults.set(str, forKey: "DataStore")
        userDefaults.synchronize()          //同期
        
    }
    
}
