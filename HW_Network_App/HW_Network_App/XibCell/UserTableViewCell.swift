//
//  UserTableViewCell.swift
//  HW_Network_App
//
//  Created by Ксения on 7/25/19.
//  Copyright © 2019 Zhdanova Ksysha. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var userId = 0
    
    func configure(_ user: User) {
        userId = user.id
        
        nameLabel.text = user.name
        phoneLabel.text = user.phone
    }
}
