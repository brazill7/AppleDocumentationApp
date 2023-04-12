//
//  ContentView.swift
//  betterAppleDocumentation
//
//  Created by Maverick on 3/17/23.
//

import SwiftUI


struct ContentView: View {
   
    @StateObject var nativeComponents = nativeComponentsList()
    @StateObject var enviromentObjects = enviromentObjectsList()
    @State private var isPresented = false
    
    @State private var searchText = ""
    
    var searchResultsNativeComponents: [Data] {
        if searchText.isEmpty {
            return nativeComponents.listData
        } else {
            return nativeComponents.listData.filter{$0.name.contains(searchText)}
        }
    }
    
    var searchResultsEnviroment: [Data]{
        if searchText.isEmpty{
            return enviromentObjects.listData
        }else{
            return enviromentObjects.listData.filter{$0.name.contains(searchText)}
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
                        
                        //MARK: Enviroment Objects
                        Section{
                            ForEach(searchResultsEnviroment){ data in
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
                            Text("Enviroment Objects")
                                .foregroundColor(.appColorBlack)
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                                
                        }.listRowSeparatorTint(.appColorBlack)
                        
                    }
                    .padding(.top, -15.0)
                    .scrollIndicators(.hidden)
                    .listStyle(.inset)
                    .searchable(text: $searchText)
                    
                    
                }/*.fullScreenCover(isPresented: $isPresented){
                    ForEach(searchResultsNativeComponents) { data in
                        listView(description: data.description, example: data.example, image: data.image, name: data.name, color: data.getColor(colors: data.colorNumber), codeText: data.codeText, scale: data.imageScale, originalScale: data.imageScale)
                    }
                }*/
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

