//
//  ContentView.swift
//  betterAppleDocumentation
//
//  Created by Maverick on 3/17/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State var localData = appStorage()

    
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    sectionDetailedView()
                }
                .padding()
            }
        }.sheet(isPresented: $localData.first){
            welcomeSheetView()
            .onDisappear{
                localData.first = false
            }
        }
    }
}

struct welcomeSheetView: View{
    @Environment(\.dismiss) var dismiss
    @State var localData = appStorage()
    var body: some View{
        VStack {
            Text("Welcome to the Swift Component Library!\nThis App is catered towards the learning and development of your Swfit knowledge\n\nFeel free to add suggestions for additions to the apps library or customize your app experience in the settings page\n\n\n Happy Learning!\n\n(Swipe Down to continue)")
                .multilineTextAlignment(.center)
            
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


