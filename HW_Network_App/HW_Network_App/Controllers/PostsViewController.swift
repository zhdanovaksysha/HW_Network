//
//  PostsViewController.swift
//  HW_Network_App
//
//  Created by Ксения on 7/27/19.
//  Copyright © 2019 Zhdanova Ksysha. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {

    @IBOutlet weak var postsTableView: UITableView!{
        didSet {
            postsTableView.delegate = self
            postsTableView.dataSource = self
            
            let nib = UINib(nibName: "PostTableViewCell", bundle: nil)
            postsTableView.register(nib, forCellReuseIdentifier: "PostCellId")
            
            postsTableView.reloadData()
        }
    }
    
    var posts: [Post] = []
    
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
    }
    
    func setUpTableView() {
        
        self.navigationItem.title = "Posts"
        self.navigationItem.backBarButtonItem?.title = "Back To Posts"
    }
}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCellId", for: indexPath) as! PostTableViewCell
        cell.configure(posts[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
