//
//  ContentView.swift
//  betterAppleDocumentation
//
//  Created by Maverick on 3/17/23.
//

import SwiftUI


struct ContentView: View {
   
    @StateObject var nativeComponents = nativeComponentsList()
    @StateObject var kitComponents = kitExamplesList()
    @State private var isPresented = false
    
    @State private var searchText = ""
    
    var searchResultsNativeComponents: [Data] {
        if searchText.isEmpty {
            return nativeComponents.listData
        } else {
            return nativeComponents.listData.filter{$0.name.contains(searchText)}
        }
    }
    
    var searchResultsKits: [Data]{
        if searchText.isEmpty{
            return kitComponents.listData
        }else{
            return kitComponents.listData.filter{$0.name.contains(searchText)}
        }
    }

    
    var body: some View {
        NavigationView{
            ZStack {
                //Color.gray.ignoresSafeArea()
                VStack {
                    List{
                        
                        //MARK: Native Components
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
                                    
                                }//.navigationTitle("test")
                            }
                            
                        }header:{
                         Text("Native Components")
                         .foregroundColor(.appColorBlack)
                         .fontWeight(.bold)
                         .font(.system(size: 25))
                        }.listRowSeparatorTint(.appColorBlack)
                        
                        //MARK: Kits
                        Section{
                            ForEach(searchResultsKits){ data in
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
                            Text("Swift Kits")
                                .foregroundColor(.appColorBlack)
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                                
                        }.listRowSeparatorTint(.appColorBlack)
                        
                    }
                    .padding(.top, -15.0)
                    .scrollIndicators(.hidden)
                    .listStyle(.inset)
                    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                    
                    
                }
                .padding()
            }
        }
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*ForEach(nativeComponents.listData){ data in
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
}*/

