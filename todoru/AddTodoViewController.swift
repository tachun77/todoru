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
    @IBOutlet weak var date : UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var memo : UITextField!
    
    
    let nowDate = NSDate()
    let dateFormat = NSDateFormatter()
    let inputDatePicker = UIDatePicker()
    var toolBar:UIToolbar!
    
    @IBAction func choosedate(sender : UITextField!){
        //datePicker.hidden = false
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
    let saveData = NSUserDefaults.standardUserDefaults().arrayForKey("todo") as? [[String]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        datePicker.hidden = true
        
        // 入力欄の設定
        //textField = UITextField(frame: CGRectMake(self.view.frame.size.width/3, 100, 0, 0))
        date.placeholder = String(format(datePicker.date, style: "yyyy/MM/dd HH:mm"))
        //textField.sizeToFit()
        self.view.addSubview(date)
        
        // UIDatePickerの設定
        datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.DateAndTime
        date.inputView = datePicker
        
        // UIToolBarの設定
        toolBar = UIToolbar(frame: CGRectMake(0, self.view.frame.size.height/6, self.view.frame.size.width, 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = .BlackTranslucent
        toolBar.tintColor = UIColor.whiteColor()
        toolBar.backgroundColor = UIColor.blackColor()
        
        let toolBarBtn = UIBarButtonItem(title: "完了",style: UIBarButtonItemStyle.Plain, target: self, action: #selector(AddTodoViewController.tappedToolBarBtn(_:)))
        
        toolBarBtn.tag = 1
        toolBar.items = [toolBarBtn]
        
        
        date.inputAccessoryView = toolBar
        
        func changeLabelDate() {
            date.text = String(date)
        }
        
        
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

        NSUserDefaults.standardUserDefaults().setObject(todoArray, forKey:"todo")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        performSegueWithIdentifier("tokanryou", sender: nil)
        
        //self.presentViewController(CompleteViewController, animated: true, completion: nil)        // Viewの移動
    }
    
    // 「完了」を押すと閉じる
    func tappedToolBarBtn(sender: UIBarButtonItem) {
        date.resignFirstResponder()
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

