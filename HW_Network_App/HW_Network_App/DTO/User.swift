//
//  User.swift
//  HW_Network_App
//
//  Created by Ксения on 7/25/19.
//  Copyright © 2019 Zhdanova Ksysha. All rights reserved.
//

import Foundation

class User: Codable {
    
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company
}

class Company: Codable {
    
    var name: String
    var catchPhrase: String
    var bs: String
}

class Address: Codable {
    
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: Geo
}

class Geo: Codable {
    
    var lat: String
    var lng: String
}
