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
    @Published var reachedMaxLimit: Bool = false // whether the API has reached max item limit or not, if this is true, stop making extra API Calls
    
    
    // class methods
    
    
    // completion handler will mimic async/await for this app, will notify us when worl is done
    
    func getArticles(getRefreshedData: Bool = false, completion: @escaping([NewsArticles]) -> Void) {
        self.getNewsData(getRefreshedData: getRefreshedData) { resp in // response from news data API can trigger things for future purposes
            if resp == true {
                if getRefreshedData == true { // append data to front of array
                    print("getRefreshedData")
                    
                    
                    // filter out new data
                    var tempArr: [NewsArticles] = [NewsArticles]()
                    for item in self.newsArticles {
                        var contains = false
                        for itemList in self.newsArticleList { // pretty bad function but API does'nt have a unique ID forEach article
                            if item.urlToImage ?? "" == itemList.urlToImage ?? "" { // already present in view
                                contains = true
                                break
                            }
                        }
                        if !contains {
                            tempArr.append(item)
                        }
                    }
                    print(tempArr.count)
                    self.newsArticleList = tempArr + self.newsArticleList
                    
                }
                else {
                    self.newsArticleList.append(contentsOf: self.newsArticles) // initial data loaded
                }
            }
            else {
                self.reachedMaxLimit = true // we have reached  max limit possible
            }
            completion(self.newsArticles)
        }
    }
    
    
    func getNewsData(getRefreshedData: Bool = false, completion: @escaping(Bool) -> Void) {
        // if yu are connected to interenet
        self.newsArticles.removeAll() // remove previously called articles
        
        if NetworkReachabilityManager.init()!.isReachable {
            
            // modify pagenumber value for refresh instead of making new API call
            var currPageNum = self.pageNum
            if getRefreshedData { currPageNum = 1 }
            
            let paramStr = "?domains=techcrunch.com,thenextweb.com&page=\(String(currPageNum))&pageSize=10"
            
            // calling API endpoint
            API.getNewsData.callAPI(baseURL: infoForKey("CMSBaseURL")!, param: nil, paramStr: paramStr) { (isSuccess, result, responseCode)  in

                if result["status"] == "ok" {
                    // if there is some result then parse it
                    
                    let jsonData = getDataFrom(JSON: result)
                    
                    // try to decode data if your models are in correct format else raise error
                    if let data = jsonData {
                        do {
                            let decodedResponse = try JSONDecoder().decode(NewsModel.self, from: data) // JSONDecoder parses our data
                            if decodedResponse.articles?.count ?? 0 > 0 { // if there are any articles pass them
                                self.newsArticles = decodedResponse.articles!
                            }
                        }
                        catch let jsonError as NSError {
                            debugPrint(jsonError)
                            completion(false)
                        }
                    }
                    completion(true)
                }
                else {
                    // we have reached limit of our API
                    completion(false)
                }
            }
        }
        else {
            self.alertButton(passedText: AppConstant.NoInternetSubtitle)
        }
    }
    
}
