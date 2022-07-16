//
//  NewsComponents.swift
//  Assignment
//
//  Created by Akshay Kalucha on 16/07/22.
//

import SwiftUI

// this view will render all the components of our page, like cells, navbar, webview, etc
struct NewsComponents: View {
    
    @EnvironmentObject var vm: NewsViewModel
    
    @Binding var newsItems: [NewsArticles]
    
    var body: some View {
        VStack(alignment: .leading) {
            // wrapping scrollview inside geometry reader to persist the height and width of view
            NavView()
            GeometryReader { proxy in
                ScrollView {
                    PullToRefresh(coordinateSpaceName: "pullToRefresh") {
                        // do your stuff when pulled, UI Optimization: New data is added to top of list and not whole view is re-rendered
                        print("refreshing the list")
                        self.vm.getArticles(getRefreshedData: true) { _ in }
                    }
                    NewsArticleList()
                }.coordinateSpace(name: "pullToRefresh") // view sticks to top anchor
            }
            
        }// VStack
    }
}
