//
//  CommentsViewController.swift
//  HW_Network_App
//
//  Created by Ксения on 7/29/19.
//  Copyright © 2019 Zhdanova Ksysha. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var commentsTableView: UITableView!{
        didSet {
            commentsTableView.delegate = self
            commentsTableView.dataSource = self
            
            let nib = UINib(nibName: "CommentTableViewCell", bundle: nil)
            commentsTableView.register(nib, forCellReuseIdentifier: "CommentCellId")
            
            commentsTableView.reloadData()
        }
    }
    
    var comments: [Comment] = []
    
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
    }
    
    func setUpTableView() {
        
        self.navigationItem.title = "Comments"
        self.navigationItem.backBarButtonItem?.title = "Back To Comments"
    }
}

extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCellId", for: indexPath) as! CommentTableViewCell
        
        cell.configure (comments[indexPath.row])
        
        return cell
    }
}
