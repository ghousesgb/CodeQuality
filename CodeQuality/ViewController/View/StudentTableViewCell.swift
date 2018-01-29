//
//  StudentTableViewCell.swift
//  CodeQuality
//
//  Created by Ghouse Basha Shaik on 29/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var studentObj : Student? {
        didSet {
            configureCell()
        }
    }
    
    func configureCell() {
        nameLabel.text      =   studentObj?.name
        addressLabel.text   =   studentObj?.address
    }
}
