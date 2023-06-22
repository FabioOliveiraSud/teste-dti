//
//  PostViewModel.swift
//  Blog App
//
//  Created by Fabio Avila Oliveira on 20/06/23.
//

import Foundation

class PostViewModel {
    
    private let apiMock = APIMock()
    var posts: [Post] = []
    
    
   func fetchPosts(completion: @escaping (Bool?, Error?) -> Void) {
        apiMock.fetchPosts { posts, error in
            if error == nil {
                guard let posts = posts else { return }
                self.posts = posts
                completion(true, nil)
            } else {
                completion(false, error)
            }
        }
    }
    
    func addNewPost(post: Post, completion: @escaping (Bool?,Error?) -> Void) {
        apiMock.addPost(post: post, completion: completion)
    }
}
