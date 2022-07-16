//
//  GlobalViewModel.swift
//  Assignment
//
//  Created by Akshay Kalucha on 16/07/22.
//

import Foundation
import SwiftUI
import UIKit



// this is VM that contains global functions, in best practice, each viewmodel should inherit properties and methods of global VM
class GlobalViewModel: ObservableObject {
    
    
    //MARK: AlertButton()
    func alertButton(passedText : String) {
        let alert = UIAlertController(title: "Warning", message:  passedText, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            alert.isModalInPresentation = true
            topController.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: MAkE Date
    
    // make date out of timestamp
    func makeDate(date: String) -> String {
        let arr_created_at = date.split(separator: "T")
                
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let dateCreated = dateFormatter.date(from:String(arr_created_at[0]))
        
        
        let newDateFormatter = DateFormatter()
        newDateFormatter.dateFormat = "E"
        let dayOfTheWeekString = newDateFormatter.string(from: dateCreated!) // extract day of week

        let newDateFormatter0 = DateFormatter()
        newDateFormatter0.dateFormat = "dd"
        let dateOfString = newDateFormatter0.string(from: dateCreated!) // extract date
 
        let newDateFormatter1 = DateFormatter()
        newDateFormatter1.dateFormat = "MMM"
        let monthOfString = newDateFormatter1.string(from: dateCreated!) // extract month
        let dateMade = "\(dayOfTheWeekString), \(dateOfString) \(monthOfString)" // made s string date out of extracted
        return dateMade
    }
    
    
    // MARK: Show web view
    func webView(url: String) {
        let storyboard = UIStoryboard(name: "WebView", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "WebViewVC") as! WebViewVC
        vc.urltoload = url
        vc.modalPresentationStyle = .fullScreen
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.present(vc, animated: true, completion: nil)
        }
    }
}
