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
    

    @IBOutlet var label1 : UITextField!
    @IBOutlet var label2 : UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var label3 : UITextField!
    
    
    @IBAction func choosedate(sender: UIDatePicker){
        label2.text = format(datePicker.date, style: "yyyy/MM/dd HH:mm")
    }
    var importance : String
    
    
    @IBAction func importance(sender: UISegmentedControl){
        switch sender.selectedSegmentIndex{
            
            
        case 0 : importance = "1"
        case 1 : importance = "2"
        case 2 : importance = "3"
        case 3 : importance = "4"
        case 4 : importance = "5"
            
        }
        
        var todoArray: [AnyObject]=[]
        let saveData = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
if saveData.arrayForKey
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
