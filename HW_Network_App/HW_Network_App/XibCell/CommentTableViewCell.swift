//
//  CommentTableViewCell.swift
//  HW_Network_App
//
//  Created by Ксения on 7/29/19.
//  Copyright © 2019 Zhdanova Ksysha. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var commentId = 0
    
    func configure(_ comment: Comment) {
        commentId = comment.id
        
        nameLabel.text = comment.name
        bodyLabel.text = comment.body
    }
}
