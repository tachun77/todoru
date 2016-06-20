//
//  AddTodoViewController.swift
//  todoru
//
//  Created by 福島達也 on 2016/06/18.
//  Copyright © 2016年 Tatsuya Fukushima. All rights reserved.
//

import UIKit

func format(date : NSDate, style : String) -> String {
    let dateFormatter = NSDateFormatter()
    dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
    dateFormatter.dateFormat = style
    return  dateFormatter.stringFromDate(date)
}

class AddTodoViewController: UIViewController {
    
    
    

    @IBOutlet var task : UITextField!
    @IBOutlet var date : UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var memo : UITextField!
    
    
    let nowDate = NSDate()
    let dateFormat = NSDateFormatter()
    let inputDatePicker = UIDatePicker()
    
    
    @IBAction func choosedate(sender : UITextField!){
        datePicker.hidden = false
        date.text = format(datePicker.date, style: "yyyy/MM/dd HH:mm")
       
    }
    var importance : String = ""
    
    
    @IBAction func importance(sender: UISegmentedControl){
        switch sender.selectedSegmentIndex{
            
            
        case 0 : importance = "1"
        case 1 : importance = "2"
        case 2 : importance = "3"
        case 3 : importance = "4"
        case 4 : importance = "5"
        default : importance = "0"
            
        }
    
    }
    var todoArray: [String: String]=[:]
        let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //日付フィールドの設定
        
        date.text = format(datePicker.date, style: "yyyy/MM/dd HH:mm")
        
        //self.date.delegate = self
        datePicker.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(sender: UIButton){
        
        todoArray["task"] = task.text!
        todoArray["date"] = date.text!
        todoArray["importance"] = importance
        todoArray["memo"] = memo.text!
    }
    
    
    
    
        @IBAction func gotokanryou(sender:AnyObject){
            self.dismissViewControllerAnimated(true, completion: nil)
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

