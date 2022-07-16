//
//  NavView.swift
//  Assignment
//
//  Created by Akshay Kalucha on 16/07/22.
//

import SwiftUI

struct NavView: View {
    
    @State var isFocused: Bool = false // hide magnifying glass if textfield is focused
    
    @EnvironmentObject var vm: NewsViewModel
    
    @State var newsSearch: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {

            // heading
            VStack(alignment: .leading, spacing: 7) {
                Text("Discover")
                    .font(.custom("Gilroy-ExtraBold", size: 40))
                Text("News from all over the world")
                    .font(.custom("Gilroy-Medium", size: 18))
                    .foregroundColor(Color(UIColor.systemGray))
            }.padding(.top)
            
            // search box
            HStack {
                RoundedRectangle(cornerRadius: 18).stroke(Color(UIColor.systemGray4).opacity(0.8), lineWidth: 0.5)
                    .background(
                        RoundedRectangle(cornerRadius: 18).fill(Color(UIColor.systemGray4)).opacity(0.2)
                    )
                    .frame(width: AppConstant.screenWidth * 0.92, height: AppConstant.screenHeight * 0.0625)
                    .overlay( // textfield
                        HStack(alignment: .center) {
                            if !self.isFocused { // show magnifying glass in search box
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color(UIColor.systemGray4))
                                    .font(.custom("Gilroy-Light", size: 30))
                            }
                            TextField("Search", text: $newsSearch, onEditingChanged: { (editingChanged) in
                                if editingChanged {
                                    self.isFocused = true
                                } else {
                                    self.isFocused = false
                                }
                            }).submitLabel(.search) // search button
                                .font(.custom("Gilroy-Medium", size: 18))
                                .foregroundColor(Color(UIColor.systemGray2))
                                .animation(.easeInOut)
                            
                        }
                            .frame(alignment: .center)
                            .padding(.leading)
                    )
            }
            
        } // VStack
        .padding([.horizontal, .vertical])
    }
}

