//
//  StackContoroller.swift
//  PDCA
//
//  Created by 大嶋　涼 on 2019/08/29.
//  Copyright © 2019 大嶋　涼. All rights reserved.
//

import Foundation
import UIKit

class StackController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var NiceLabel: UILabel!
    @IBOutlet weak var BadLabel: UILabel!
    @IBOutlet weak var NoticedLabel: UILabel!
    @IBOutlet weak var ActionLabel: UILabel!
    
    
    var key:String = ""
    var nice:String = ""
    var bad:String = ""
    var noticed:String = ""
    var action:String = ""
    
    //   UserDefaults のインスタンス
    let userDefaults = UserDefaults.standard
    
    // textFiel の情報を受け取るための delegate を設定
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("stack")
        titleLabel.text = key
        userDefaults.register(defaults: ["DataStore": "default"])
        parse()
        
        
    }
    
    
    //Stringを/ごとに分けて元の情報を取得
    func parse() -> Void {
        // Keyを指定して元の文を取得
        let str:String = userDefaults.object(forKey: key) as! String
        
        print(str)
        //空の配列にparseしていく
        let array = str.components(separatedBy: "/")
        nice = array[0]
        bad = array[1]
        noticed = array[2]
        action = array[3]
        print("nice " ,nice)
        print("bad " ,bad)
        print("notice ",noticed)
        print("action ",action)
        
        set()
    }
    
    //labelにセットしていく
    func set() -> Void{
        NiceLabel.text = nice
        BadLabel.text = bad
        NoticedLabel.text = noticed
        ActionLabel.text = action
        
    }
    
    
}
