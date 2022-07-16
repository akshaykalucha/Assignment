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
        Text("Component items")
    }
}
