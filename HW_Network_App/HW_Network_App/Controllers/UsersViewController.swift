//
//  UsersViewController.swift
//  HW_Network_App
//
//  Created by Ксения on 7/26/19.
//  Copyright © 2019 Zhdanova Ksysha. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView! {
        didSet {
            userTableView.delegate = self
            userTableView.dataSource = self
            
            let nib = UINib(nibName: "UserTableViewCell", bundle: nil)
            userTableView.register(nib, forCellReuseIdentifier: "UserCellID")
        }
    }
    
    var users: [User] = [] {
        didSet {
            userTableView.reloadData()
        }
    }
    
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.getUsers {[weak self] (users) in
            DispatchQueue.main.async {
                self?.users = users
            }
        }
    }

}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCellID", for: indexPath) as! UserTableViewCell
        cell.configure(users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! UserTableViewCell
        
        networkManager.getPostsByUserId(userId: cell.userId) {[weak self] (postsByUserId) in
            DispatchQueue.main.async {

                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "PostsVCId") as! PostsViewController

                vc.posts = postsByUserId

                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
