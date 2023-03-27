//
//  ContentView.swift
//  betterAppleDocumentation
//
//  Created by Maverick on 3/17/23.
//

import SwiftUI


struct ContentView: View {
   
    @StateObject var dataList = listsData()
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                    Section{
                        ForEach(dataList.listData){ data in
                            NavigationLink{
                                listView(description: data.description, example: data.example, image: data.image, name: data.name, color: data.getColor(colors: data.colorNumber), scale: data.imageScale, originalScale: data.imageScale)
                                    
                            }label:{
                                Text(Image(systemName: data.sfSymbol))
                                    .foregroundColor(data.getColor(colors: data.colorNumber))
                                    .fontWeight(.bold)
                                Text(data.name)
                                    .foregroundColor(data.getColor(colors: data.colorNumber))
                                    .fontWeight(.bold)
                                    
                            }
                        }
                            
                    }header:{
                        Text("Native Components")
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
