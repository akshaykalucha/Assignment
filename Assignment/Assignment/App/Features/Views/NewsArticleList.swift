//
//  NewsArticleList.swift
//  Assignment
//
//  Created by Akshay Kalucha on 16/07/22.
//

import SwiftUI
import BetterSafariView


// this view will contain list of news article
struct NewsArticleList: View {
    
    @EnvironmentObject var vm: NewsViewModel
    
    @State var URLToShow: String = "https://www.twitter.com/aksxayy"
    @State var presentWebView: Bool = false
    
    
    var body: some View {
        VStack(alignment: .leading) {
            // lazy vastack optimizes the speed of view as it only loads view when it runs into the view instead of upfront rendering it outside view
            LazyVStack(alignment: .leading, spacing: 20) {
                // show loader
                if self.vm.isLoading {
                    VStack(alignment: .center) { // show loader in center top of screen
                        ProgressView()
                    }.frame(width: AppConstant.screenWidth)
                        .padding(.vertical)
                }
                
                else {
                    ForEach(Array(self.vm.newsArticleList.enumerated()), id: \.1.id) { (index, article) in
                        ArticleCell(articleData: article) // passing the article data
                        
                            // pagination
                            .onAppear {
                                if index > self.vm.newsArticleList.count - 2 {
                                    self.vm.pageNum += 1
                                    self.vm.getArticles() { _ in }
                                }
                            }
                            .onTapGesture { // show web view
                                self.URLToShow = article.url ?? "https://www.twitter.com/aksxayy"
                                self.presentWebView.toggle()
                            }
                        
                        // divider after every news article cell
                        
                        if index < self.vm.newsArticleList.count - 1 {
                            Divider()
                        }
                    }
                    
                    if self.vm.reachedMaxLimit == false { // while we haven't reached max limit, get the next page
                        VStack(alignment: .center) { // show loader in center top of screen
                            ProgressView()
                        }.frame(width: AppConstant.screenWidth)
                            .padding(.vertical)
                    }
                }
            }
        }
        // safari web view
        .safariView(isPresented: $presentWebView) {
            SafariView(
                url: URL(string: self.URLToShow)!,
                configuration: SafariView.Configuration(
                    entersReaderIfAvailable: false,
                    barCollapsingEnabled: true
                )
            )
        }
    }
}
