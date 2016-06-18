//
//  ListTableViewCell.swift
//  todoru
//
//  Created by 福島達也 on 2016/06/17.
//  Copyright © 2016年 Tatsuya Fukushima. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet var dateLabel:UILabel!
    @IBOutlet var todoLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
