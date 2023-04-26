//
//  sectionDetailedView.swift
//  betterAppleDocumentation
//
//  Created by Maverick Brazill on 4/26/23.
//

import SwiftUI

struct sectionDetailedView: View {
    var nativeComponents = nativeComponentsList()
    var kitComponents = kitExamplesList()
    @State var localData = appStorage()
    @State var searchText = ""
    
    var searchResultsKits: [kitData]{
        if searchText.isEmpty{
            return kitComponents.listData
        }else{
            return kitComponents.listData.filter{$0.name.contains(searchText)}
        }
    }
    var searchResultsNativeComponents: [Data] {
        if searchText.isEmpty {
            return nativeComponents.listData
        } else {
            return nativeComponents.listData.filter{$0.name.contains(searchText)}
        }
    }
    var body: some View {
        List{
            //MARK: -Kits
            Section{
                ForEach(searchResultsKits) { kit in
                    DisclosureGroup{
                        ForEach(kit.data) { data in
                            NavigationLink{
                                listView(description: data.description, example: data.example, image: data.image, name: data.name, color: data.getColor(colors: data.colorNumber), codeText: data.codeText, iOSscale: data.imageScaleiOS, originaliOSScale: data.imageScaleiOS, macPadOSScale: data.imageScaleMacPadOS, macPadOSORginialScale: data.imageScaleMacPadOS)
                            }label:{
                                Text(Image(systemName: data.sfSymbol))
                                    .foregroundColor(data.getColor(colors: data.colorNumber))
                                    .fontWeight(.bold)
                                Text(data.name)
                                    .foregroundColor(data.getColor(colors: data.colorNumber))
                                    .fontWeight(.black)
                            }
                        }
                    }label:{
                        HStack {
                            Text("\(Image(systemName: kit.sfSymbol)) \(kit.name)")
                                .foregroundColor(kit.color)
                        }
                    }
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
                                .foregroundColor(.clear)
                                .padding(EdgeInsets(top: -8, leading: -800, bottom: -8, trailing: -800))
                        }
                    }
                    
            }.listRowSeparatorTint(.appColorBlack)
            
            
            //MARK: -Native Components
            Section{
                ForEach(searchResultsNativeComponents){ data in
                    NavigationLink{
                        listView(description: data.description, example: data.example, image: data.image, name: data.name, color: data.getColor(colors: data.colorNumber), codeText: data.codeText, iOSscale: data.imageScaleiOS, originaliOSScale: data.imageScaleiOS, macPadOSScale: data.imageScaleMacPadOS, macPadOSORginialScale: data.imageScaleMacPadOS)
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
                         .foregroundColor(.clear)
                         .padding(EdgeInsets(top: -8, leading: -800, bottom: -8, trailing: -800))
                 }
             }
            }.listRowSeparatorTint(.appColorBlack)
                .foregroundColor(.appColorBlack)
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .padding(.top, -15.0)
        .scrollIndicators(.hidden)
        .listStyle(.inset)
        .toolbar(content: {
            NavigationLink{
                settingsView()
            }label: {
                Image(systemName: "gear")
                    .foregroundColor(.gray)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
            }
        })
    }
}

struct sectionDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        sectionDetailedView()
    }
}
