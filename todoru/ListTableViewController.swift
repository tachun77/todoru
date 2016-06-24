//
//  ListTableViewController.swift
//  todoru
//
//  Created by 福島達也 on 2016/06/17.
//  Copyright © 2016年 Tatsuya Fukushima. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var todoArray: [[String:String]]=[[:]]
    let saveData = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()


    override func viewWillAppear(animated: Bool) {
        super.viewDidLoad()
        
        //保存データの読み込み
        if saveData.arrayForKey("todo") as? [[String]] != nil{
            todoArray = saveData.arrayForKey("todo")!
        }
     tableView.reloadData()
        }
       
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell! {
        
        let CellIdentifier: String = "cell";
        var cell: MCSwipeTableViewCell! = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as MCSwipeTableViewCell!;
        if cell == nil {
            cell = MCSwipeTableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: CellIdentifier);
            cell!.selectionStyle = UITableViewCellSelectionStyle.Gray;
            cell!.contentView.backgroundColor = UIColor.whiteColor();
        }
        
        let checkView: UIView = self.viewWithImageName("check");
        let greenColor: UIColor = UIColor(red: 85.0 / 255.0, green: 213.0 / 255.0, blue: 80.0 / 255.0, alpha: 1.0);
        
        let crossView: UIView = self.viewWithImageName("cross");
        let redColor: UIColor = UIColor(red: 232.0 / 255.0, green: 61.0 / 255.0, blue: 14 / 255.0, alpha: 1.0);
        
        let clockView: UIView = self.viewWithImageName("clock");
        let yellowColr: UIColor = UIColor(red: 254.0 / 255.0, green: 217.0 / 255.0, blue: 56.0 / 255.0, alpha: 1.0);
        
        let listView = self.viewWithImageName("list");
        let brownColor: UIColor = UIColor(red: 206.0 / 255.0, green: 149.0 / 255.0, blue: 98.0 / 255.0, alpha: 1.0);
        
        cell.textLabel?.text = "Switch mode cell";
        cell.detailTextLabel?.text = "Swipe to swich";
        
        cell.setSwipeGestureWithView(checkView, color: greenColor, mode: MCSwipeTableViewCellMode.Exit, state: MCSwipeTableViewCellState.State1, completionBlock:
            
            { (cell: MCSwipeTableViewCell!, state: MCSwipeTableViewCellState!, mode: MCSwipeTableViewCellMode!) in   println("Did swipe \"Checkmark\" cell")
                []
        });
        
        cell.setSwipeGestureWithView(crossView, color: redColor, mode: MCSwipeTableViewCellMode.Exit, state: MCSwipeTableViewCellState.State2, completionBlock:
            
            { (cell : MCSwipeTableViewCell!, state: MCSwipeTableViewCellState!, mode: MCSwipeTableViewCellMode!) in println("Did swipe \"cross\" ");
            }
        )
        
        cell.setSwipeGestureWithView(clockView, color: yellowColr, mode: .Exit, state: .State3) {
            (cell : MCSwipeTableViewCell!, state : MCSwipeTableViewCellState!, mode : MCSwipeTableViewCellMode!) in println("Did swipe \"Clock \"");
        };
        
        cell.setSwipeGestureWithView(listView, color: brownColor, mode: .Switch, state: .State4) {
            (cell: MCSwipeTableViewCell!, state: MCSwipeTableViewCellState!, mode: MCSwipeTableViewCellMode!) in println("Did swipe \"List\" cell");
        }
        return cell;
    }

        
        
        /*let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ListTableViewCell
        
        let nowIndexPathDictionary: (AnyObject) = todoArray[indexPath.row]
        
        cell.dateLabel.text = nowIndexPathDictionary["date"] as? String
        cell.todoLabel.text = nowIndexPathDictionary["task"] as? String
        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
