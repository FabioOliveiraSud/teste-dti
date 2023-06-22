//
//  DetailPostViewController.swift
//  Blog App
//
//  Created by Fabio Avila Oliveira on 19/06/23.
//

import UIKit

class DetailPostViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: - Properties
    var post: Post?
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    //MARK: - Method
    func setUI() {
        self.title = "Detalhes do Post"
        postLabel.text = post?.title
        dateLabel.text =  post?.date
        descriptionLabel.text = post?.content
    }
}

    
