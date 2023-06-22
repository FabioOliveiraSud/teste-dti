//
//  Post.swift
//  Blog App
//
//  Created by Fabio Avila Oliveira on 20/06/23.
//

import Foundation

struct Posts: Codable {
    var posts: [Post]
}

struct Post: Codable  {
    let title: String
    let date: String
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case title, date, content
    }
}

