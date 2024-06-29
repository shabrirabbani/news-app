//
//  Article.swift
//  news-app
//
//  Created by Shabri Rabbani on 27/06/24.
//

import Foundation

struct Article: Codable {
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
}

struct NewsResponse: Codable {
    let articles: [Article]
}
