//
//  NetworkManager.swift
//  HW_Network_App
//
//  Created by Ксения on 7/25/19.
//  Copyright © 2019 Zhdanova Ksysha. All rights reserved.
//

import Foundation

class NetworkManager {
    
    enum HTTPMethod: String {
        case POST
        case PUT
        case DELETE
        case GET
    }
    
    enum API: String {
        case posts
        case users
        case comments
    }
    
    private let baseUrl = "https://jsonplaceholder.typicode.com/"
    
    func getPosts(_ complitionHandler: @escaping ([Post]) -> Void) {
        
        if let url = URL(string: baseUrl + API.posts.rawValue) {
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print("error")
                }
                else {
                    if let resp = response as? HTTPURLResponse,
                        resp.statusCode == 200,
                        let respData = data {
                        
                        let posts = try? JSONDecoder().decode([Post].self, from: respData)
                        
                        complitionHandler(posts ?? [])
                    }
                }
                }.resume()
        }
    }
    
    func getComments(_ complitionHandler: @escaping ([Comment]) -> Void) {
        
        if let url = URL(string: baseUrl + API.comments.rawValue) {
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print("error")
                }
                else {
                    if let resp = response as? HTTPURLResponse,
                        resp.statusCode == 200,
                        let respData = data {
                        
                        let comments = try? JSONDecoder().decode([Comment].self, from: respData)
                        
                        complitionHandler(comments ?? [])
                    }
                }
                }.resume()
        }
    }
    
    func getUsers(_ complitionHandler: @escaping ([User]) -> Void) {
        
        guard let url = URL(string: baseUrl + API.users.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("error")
            }
            else {
                if let resp = response as? HTTPURLResponse,
                    resp.statusCode == 200,
                    let respData = data {
                    
                    let users = try? JSONDecoder().decode([User].self, from: respData)
                    
                    complitionHandler(users ?? [])
                }
            }
            }.resume()
    }
    
    func getPostsByUserId(userId: Int, _ complitionHandler: @escaping ([Post]) -> Void) {
        
        guard let url = URL(string: baseUrl + API.posts.rawValue) else { return }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = [URLQueryItem(name: "userId", value: "\(userId)")]
        
        guard let queryURL = components?.url else { return }
        
        URLSession.shared.dataTask(with: queryURL) { (data, response, error) in
            
            if error != nil {
                print(error.debugDescription)
            } else if let resp = response as? HTTPURLResponse,
                resp.statusCode == 200,
                let respData = data{
                
                let posts = try? JSONDecoder().decode([Post].self, from: respData)
                
                complitionHandler(posts ?? [])
                
            }
        }.resume()
    }
    
    func getCommentsByPostId(_ postId: Int, _ complitionHandler: @escaping ([Comment]) -> Void) {
        
        guard let url = URL(string: baseUrl + API.comments.rawValue) else { return }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = [URLQueryItem(name: "postId", value: "\(postId)")]
        
         guard let queryURL = components?.url else { return }
        
        URLSession.shared.dataTask(with: queryURL) { (data, response, error) in
            if error != nil {
                print(error.debugDescription)
            } else if let resp = response as? HTTPURLResponse,
            resp.statusCode == 200,
                let respData = data {
                
                let comments = try? JSONDecoder().decode([Comment].self, from: respData)
                
                complitionHandler(comments ?? [])
            }
        }.resume()
    }
}
