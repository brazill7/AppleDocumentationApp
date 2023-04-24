//
//  betterAppleDocumentationApp.swift
//  betterAppleDocumentation
//
//  Created by Maverick on 3/17/23.
//

import SwiftUI

@main
struct betterAppleDocumentationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                //.preferredColorScheme(.dark)
        }
    }
}


extension Color{
    static let appColorWhite = Color("appColorWhite")
    static let appColorBlack = Color("appColorBlack")
    static let lightGray = Color(red: 211/255, green: 211/255, blue: 211/255)
}
