//
//  NewsViewModel.swift
//  Assignment
//
//  Created by Akshay Kalucha on 16/07/22.
//

import SwiftUI
import Foundation
import Combine
import Alamofire
import UIKit
import SwiftyJSON


class NewsViewModel: GlobalViewModel {
    
    // class vars
    @Published var newsList:[String] = []
    @Published var pageNum: Int = 1
    @Published var newsArticles: [NewsArticles] = [NewsArticles]()
    @Published var newsArticleList: [NewsArticles] = [NewsArticles]()
    @Published var isLoading: Bool = false
    @Published var reachedMaxLimit: Bool = false // weather API has reached max item limit or not, if this is true, stop making extra API Calls
    
    
    // class methods
    
    
}
