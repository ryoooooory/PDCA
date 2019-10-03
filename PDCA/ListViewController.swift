//
//  ListViewController.swift
//  PDCA
//
//  Created by 大嶋　涼 on 2019/09/02.
//  Copyright © 2019 大嶋　涼. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController{
    
    var keytext:String?
    var datanum: Int?
    var selectedcellnum: Int = 0
    
    let userDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaults.register(defaults: ["DataStore": "default"])
        
        
    }
    
    //Cellの数の設定
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let Itemnum:Int = userDefaults.object(forKey: "Num") as! Int
        
        return Itemnum
    }
    
    
    //cellの中身(title)設定
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = userDefaults.object(forKey:String(indexPath.row)) as? String             //title
        print(indexPath.row)
        let title: String = userDefaults.object(forKey:String(indexPath.row)) as! String
        print(title)
        
        return cell
    }
    
    
    //選ばれたせcellのタイトルを遷移先のcontrollerに渡す
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("tableview")
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        selectedcellnum = indexPath.row
        print(selectedcellnum+1000)
        
    }
    
    
    
    //画面遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare")
        
        if let indexPath = self.tableView.indexPathForSelectedRow{
//            selectedcellnum = indexPath.row
            var title: String = userDefaults.object(forKey:String(indexPath.row)) as! String

            let secondVC: StackController = (segue.destination as? StackController)!        //ViewControllerの決定
            print(title)
            
            secondVC.key = String(title)
        }
        
        
        //        if (segue.identifier == "StackController"){                 //segueの判定をしないと戻るでバグる
        //
        //            let secondVC: StackController = (segue.destination as? StackController)!        //ViewControllerの決定
        //            print(selectedcellnum)
        //
        //            secondVC.key = String(selectedcellnum)                     //そのViewControllerのプロパティのkeyに値を代入
        //        }
    }
    
}
