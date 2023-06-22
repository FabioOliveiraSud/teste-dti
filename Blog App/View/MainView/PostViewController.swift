//
//  PostViewController.swift
//  Blog App
//
//  Created by Fabio Avila Oliveira on 19/06/23.
//

import UIKit

class PostViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newPost: UIButton!
    
    //MARK: - Properties
    var posts: [Post] = []
    var viewModel = PostViewModel()
    let cellIdentifier = "PostCell"
    let createPostIdentifier = "CreatePostViewController"
    let detailPostIdentifier = "DetailPostViewController"
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    //MARK: - IBActions
    @IBAction func newPost(_ sender: UIButton) {
        goToNewPostVC()
    }
    
    //MARK: - Methods
    func setUI() {
        self.title = "Blog App"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadData() {
        viewModel.fetchPosts { didFinishLoading, error in
            if let finishedLoading = didFinishLoading, finishedLoading {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                self.showAlert(message: error?.localizedDescription)
            }
        }
    }
    
    func goToNewPostVC() {
        let storyboard = UIStoryboard(name: "CreatePost", bundle: nil)
        guard let createVC = storyboard.instantiateViewController(withIdentifier: createPostIdentifier) as? CreatePostViewController else { return }
        createVC.viewModel = self.viewModel
        navigationController?.pushViewController(createVC, animated: true)
    }
}

//MARK: - TableView Methods
extension PostViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setCell(tableView: tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showPostDetails(indexPath: indexPath)
    }
    
    func showPostDetails(indexPath: IndexPath) {
        let post = viewModel.posts[indexPath.row]
        
        let storyboard = UIStoryboard(name: "DetailPostView", bundle: nil)
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: detailPostIdentifier) as? DetailPostViewController else { return }
        detailVC.post = post
        navigationController?.pushViewController(detailVC, animated: true)
        
        print("Detalhes")
    }
    
    func setCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? PostTableViewCell else { return  UITableViewCell() }
        
        let post = viewModel.posts[indexPath.row]
        cell.post = post
        
        return cell
    }
}
    
   
