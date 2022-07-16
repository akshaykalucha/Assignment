//
//  ArticleCell.swift
//  Assignment
//
//  Created by Akshay Kalucha on 16/07/22.
//

import SwiftUI
import Kingfisher

struct ArticleCell: View {
    
    @ObservedObject var vm = NewsViewModel() // observed object because we are not any function to mutate view
    
    var articleData: NewsArticles
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 10) {
                
                // MARK: article image
                VStack(alignment: .leading) {
                    KFImage(URL(string: articleData.urlToImage ?? ""))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: AppConstant.screenWidth * 0.35, height: AppConstant.screenHeight * 0.17)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25).stroke(Color(UIColor.systemGray4).opacity(0.3))
                        )
                }
                
                
                VStack(alignment: .leading) {
                    // MARK: article title and description
                    Text(articleData.title ?? "N/A").lineLimit(2)
                        .font(.custom("Gilroy-Medium", size: 20))
                        .foregroundColor(.black)
                    
                    Text(articleData.content ?? "N/A").lineLimit(3)
                        .font(.custom("Gilroy-Medium", size: 15))
                        .foregroundColor(Color(UIColor.systemGray))
//                        .frame(height: AppConstant.screenHeight * 0.1, alignment: .top)
                    
                    // MARK: author
                    
                    HStack(alignment: .top) {
                        
                        // author
                        HStack(spacing: 5) {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 9, height: 9)
                                .foregroundColor(Color(UIColor.systemGray))
                            Text(articleData.author ?? "Anonymous")
                                .foregroundColor(Color(UIColor.systemGray))
                                .font(.custom("Gilroy-Medium", size: 13))
                        }

                        
                        Spacer()
                        
                        // date
                        HStack(spacing: 5){
                            Image(systemName: "clock")
                                .resizable()
                                .frame(width: 9, height: 9)
                                .foregroundColor(Color(UIColor.systemGray))
                            Text(self.vm.makeDate(date: articleData.publishedAt ?? "2022-07-16T12:25:02Z"))
                                .foregroundColor(Color(UIColor.systemGray))
                                .font(.custom("Gilroy-Medium", size: 13))
                        }
                    }
                    .padding(.top)
                }
                .padding(.top, 7)
                
            }
        }
        .padding(.horizontal)
        .frame(width: AppConstant.screenWidth, height: AppConstant.screenHeight * 0.18, alignment: .leading)
    }
}
