//
//  EntryPoint.swift
//  Assignment
//
//  Created by Akshay Kalucha on 16/07/22.
//

import SwiftUI

// UI of app starts here
struct EntryPoint: View {
    var body: some View {
        
        // app level wrappers should be on top
        NavigationView {
            NewsMainView()
                .navigationViewStyle(StackNavigationViewStyle()) // view should not re render if we change binding or environment variables
                .navigationBarHidden(true) // by this we can show our own custom nav bar
        }
    }
}
