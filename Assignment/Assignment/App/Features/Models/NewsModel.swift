//
//  NewsModel.swift
//  Assignment
//
//  Created by Akshay Kalucha on 16/07/22.
//

import Foundation
import SwiftUI


struct NewsModel: Codable, Hashable, Identifiable {
    let id = UUID() // default ID for each object of this model, this will help us solve UI rendering issues
    let totalResults: Int?
    let articles: [NewsArticles]?
}


struct NewsArticles: Codable, Hashable, Identifiable {
    let id = UUID()
    let source: ArticleSource
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct ArticleSource: Codable, Hashable {
    let id: String?
    let name: String?
}
