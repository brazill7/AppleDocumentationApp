//
//  ContentView.swift
//  betterAppleDocumentation
//
//  Created by Maverick on 3/17/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @StateObject var nativeComponents = nativeComponentsList()
    @StateObject var kitComponents = kitExamplesList()
    @State var localData = appStorage()
    @State  var searchText = ""
    
    var searchResultsNativeComponents: [Data] {
        if searchText.isEmpty {
            return nativeComponents.listData
        } else {
            return nativeComponents.listData.filter{$0.name.contains(searchText)}
        }
    }
    
    var searchResultsKits: [kitData]{
        if searchText.isEmpty{
            return kitComponents.listData
        }else{
            return kitComponents.listData.filter{$0.name.contains(searchText)}
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    List{
                        //MARK: -Kits
                        Section{
                            ForEach(searchResultsKits) { kit in
                                DisclosureGroup("\(Image(systemName: kit.sfSymbol)) \(kit.name)"){
                                    ForEach(kit.data) { data in
                                        NavigationLink{
                                            listView(description: data.description, example: data.example, image: data.image, name: data.name, color: data.getColor(colors: data.colorNumber), codeText: data.codeText, scale: data.imageScale, originalScale: data.imageScale)
                                        }label:{
                                            Text(Image(systemName: data.sfSymbol))
                                                .foregroundColor(data.getColor(colors: data.colorNumber))
                                                .fontWeight(.bold)
                                            Text(data.name)
                                                .foregroundColor(data.getColor(colors: data.colorNumber))
                                                .fontWeight(.black)
                                        }
                                    }
                                }.foregroundColor(kit.color)
                                    .fontWeight(.black)
                            }
                            
                        }header:{
                            Text("Swift Kits")
                                .foregroundColor(.appColorBlack)
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                                .background{
                                    if UIDevice.current.userInterfaceIdiom == .phone{
                                        
                                    }else{
                                        Rectangle()
                                            .foregroundColor(.lightGray)
                                            .padding(EdgeInsets(top: -8, leading: -800, bottom: -8, trailing: -800))
                                    }
                                }
                                
                        }.listRowSeparatorTint(.appColorBlack)
                        
                        
                        //MARK: -Native Components
                        Section{
                            ForEach(searchResultsNativeComponents){ data in
                                NavigationLink{
                                    listView(description: data.description, example: data.example, image: data.image, name: data.name, color: data.getColor(colors: data.colorNumber), codeText: data.codeText, scale: data.imageScale, originalScale: data.imageScale)
                                }label:{
                                    Text(Image(systemName: data.sfSymbol))
                                        .foregroundColor(data.getColor(colors: data.colorNumber))
                                        .fontWeight(.bold)
                                    Text(data.name)
                                        .foregroundColor(data.getColor(colors: data.colorNumber))
                                        .fontWeight(.black)
                                    
                                }
                            }
                            
                        }header:{
                         Text("Native SwiftUI Components")
                         .foregroundColor(.appColorBlack)
                         .fontWeight(.bold)
                         .font(.system(size: 25))
                         .background{
                             if UIDevice.current.userInterfaceIdiom == .phone{
                                 
                             }else{
                                 Rectangle()
                                     .foregroundColor(.lightGray)
                                     .padding(EdgeInsets(top: -8, leading: -800, bottom: -8, trailing: -800))
                             }
                         }
                        }.listRowSeparatorTint(.appColorBlack)
                            .foregroundColor(.appColorBlack)
                    }
                    .padding(.top, -15.0)
                    .scrollIndicators(.hidden)
                    .listStyle(.inset)
                    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                    .toolbar(content: {
                        NavigationLink{
                            settingsView()
                        }label: {
                            Image(systemName: "gear")
                                .foregroundColor(.gray)
                        }
                    })
                    
                    
                    
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


