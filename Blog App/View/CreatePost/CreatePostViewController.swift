//
//  CreatePostViewController.swift
//  Blog App
//
//  Created by Fabio Avila Oliveira on 21/06/23.
//

import UIKit

class CreatePostViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    //MARK: - Properties
    var viewModel: PostViewModel?
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    //MARK: - IBActions
    @IBAction func addButtonTapped(_ sender: UIButton) {
        addButtonAction(sender)
    }
    
    //MARK: Methods
    func setUI() {
        self.title = "Novo Post"
     }
    
    func addButtonAction(_ sender: UIButton) {
        
        if let title = titleTextField.text, !title.isEmpty,
           let content = contentTextView.text, !content.isEmpty,
           let viewModel = viewModel {
            sender.loadingIndicator(true)
            
            let currentDate = Date().toString()
            print(Date())
            let newPost = Post(title: titleTextField.text!, date: currentDate, content: contentTextView.text!)
            
            viewModel.addNewPost(post: newPost) { didCreatePost, error in
                sender.loadingIndicator(false)
                if let didCreatePost = didCreatePost, didCreatePost {
                    self.navigationController?.popViewController(animated: true)
                } else {
                    self.showAlert(message: error?.localizedDescription)
                }
            }
        } else {
            self.showAlert(message: "Todos os campos devem ser preenchidos.")
        }
    }
    
}
