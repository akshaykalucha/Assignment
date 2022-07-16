//
//  AssignmentApp.swift
//  Assignment
//
//  Created by Akshay Kalucha on 16/07/22.
//

import SwiftUI


// the main entrypoint of app, here we can specify instances of windows to be created that will contain hierarchy of our app
@main
struct AssignmentApp: App {
    var body: some Scene {
        WindowGroup {
            EntryPoint()
        }
    }
}
