//
//  NewsMainView.swift
//  Assignment
//
//  Created by Akshay Kalucha on 16/07/22.
//

import SwiftUI

struct NewsMainView: View {
    
    @State var newsItems: [NewsArticles] = []
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        NewsComponents(newsItems: $newsItems).environmentObject(viewModel)
        .onAppear {
            if self.viewModel.newsArticles.count == 0 { // run only once when app is launched
                self.viewModel.isLoading = true
            }
        }
    }
}
