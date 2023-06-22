//
//  PostTableViewCell.swift
//  Blog App
//
//  Created by Fabio Avila Oliveira on 19/06/23.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var postData: UILabel!
    
    var post: Post? {
        didSet {
            guard let post = post else { return }
            fillCellWith(post: post)
        }
    }
   
    func fillCellWith(post: Post) {
        postLabel.text = post.title
        postData.text =  post.date.formatDate()
    }
}
