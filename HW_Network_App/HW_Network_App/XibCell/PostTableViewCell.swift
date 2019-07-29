//
//  PostTableViewCell.swift
//  HW_Network_App
//
//  Created by Ксения on 7/27/19.
//  Copyright © 2019 Zhdanova Ksysha. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var postId = 0
    
    func configure (_ post: Post) {
        postId = post.id
        
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
    
}
