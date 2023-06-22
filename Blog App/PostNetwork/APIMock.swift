//
//  APIMock.swift
//  Blog App
//
//  Created by Fabio Avila Oliveira on 20/06/23.
//

import Foundation


class APIMock {
    
    var posts: [Post] = []
    
    func fetchPosts(completion: @escaping ([Post]?, Error?) -> Void) {
        
        guard let path = Bundle.main.path(forResource: "postApi", ofType: "json") else {
           
            return
    }
        let url = URL(fileURLWithPath: path)
        
        print("🔗 URL: \(url)")
        
        let urlSession = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                print("data vazia")
                return }
            let decoder = JSONDecoder()
            
            if let error = error {
                print("Error Fetching Data: \(error.localizedDescription)")
                completion(nil, error)
            }
                do {
                    let postResult = try decoder.decode(Posts.self, from: data)
                    completion(postResult.posts, nil)
                } catch let error {
                    print("Error Decoding Data: \(error.localizedDescription)")
                    completion(nil, error)
                }
        }
        urlSession.resume()
    }
    
    
    func addPost(post: Post, completion: @escaping (Bool?,Error?) -> Void) {
        guard let path = Bundle.main.path(forResource: "postApi", ofType: "json") else {
            completion(false, NSError(domain: "Could not find data", code: 0))
            return
    }
        let url = URL(fileURLWithPath: path)
            
            var existingPosts: Posts
            do {
                let jsonData = try Data(contentsOf: url)
                let posts = try JSONDecoder().decode(Posts.self, from: jsonData)
                existingPosts = posts
            } catch {
                completion(false, NSError(domain: "Could not load data", code: 0))
                return
            }
            
            existingPosts.posts.append(post)
            
            guard let updatedData = try? JSONEncoder().encode(existingPosts) else {
                completion(false, NSError(domain: "Could not update data", code: 1))
                return
            }
            
            do {
                try updatedData.write(to: url)
                completion(true, nil)
            } catch let error {
                completion(false, error)
            }
    }
    
}
