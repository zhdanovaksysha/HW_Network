//
//  Comment.swift
//  HW_Network_App
//
//  Created by Ксения on 7/25/19.
//  Copyright © 2019 Zhdanova Ksysha. All rights reserved.
//

import Foundation

class Comment: Codable {
    
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
