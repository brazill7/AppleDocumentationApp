//
//  ContentView.swift
//  betterAppleDocumentation
//
//  Created by Maverick on 3/17/23.
//

import SwiftUI

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
        ZStack {
            LinearGradient(colors: [.indigo, .purple], startPoint: .topTrailing, endPoint: .bottomLeading)
            VStack {
                Image("appicon")
                    .resizable()
                    .frame(width:200, height:200)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .background{
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.black, lineWidth: 8)
                    }.padding(.bottom, 50)
                
                Text("Welcome to the Swift Component Library!\nThis App is catered towards the learning and development of your Swfit knowledge\n\nFeel free to add suggestions for additions to the apps library or customize your app experience in the settings page\n\n\n Happy Learning!\n\n(Swipe Down to continue)")
                    .multilineTextAlignment(.center)
                
            }.padding(.all, 10)
        }.ignoresSafeArea()
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


