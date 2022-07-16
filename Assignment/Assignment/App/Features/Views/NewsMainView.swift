//
//  NewsMainView.swift
//  Assignment
//
//  Created by Akshay Kalucha on 16/07/22.
//

import Foundation
import SwiftUI

struct NewsMainView: View {
    
    @StateObject var viewModel = NewsViewModel()
    @State var newsItems: [NewsArticles] = []
    
    var body: some View {
        NewsComponents(newsItems: $newsItems).environmentObject(viewModel)
        .onAppear {
            if self.viewModel.newsArticles.count == 0 { // run only once when app is launched
                self.viewModel.isLoading = true
                self.viewModel.getArticles() { resp in // fetch news articles of required page
                    self.newsItems = resp // populating front end from view model for backup is a good practice rather than rendering items in viewmodel itself
                    self.viewModel.isLoading = false
                }
            }
        }
    }
    
}
