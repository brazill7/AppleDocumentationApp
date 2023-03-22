//
//  ContentView.swift
//  betterAppleDocumentation
//
//  Created by Maverick Brazill on 3/17/23.
//

import SwiftUI

extension Color{
    static let appColorWhite = Color("appColorWhite")
    static let appColorBlack = Color("appColorBlack")
}
struct ContentView: View {
    @State var headerTest = ["button", "text", "image"]
    @StateObject var dataList = listsData()
    //@State var text = listTest(name: "test", sfSymbol: "cloud")
    
    var body: some View {
        NavigationView{
            VStack {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundColor(.accentColor)
//                Text("Hello, world!")
                List{
                    Section{
                        ForEach(dataList.listData){ data in
                            NavigationLink{
                                listView(targetHeight: CGFloat(data.height), imageHeight: CGFloat(data.imageHeight), description: data.description, example: data.example, image: data.image, name: data.name, color: data.color, override: data.overrideImageLocation)
                            }label:{
                                Text(Image(systemName: data.sfSymbol))
                                    .foregroundColor(data.color)
                                    .fontWeight(.bold)
                                Text(data.name)
                                    .foregroundColor(data.color)
                                    .fontWeight(.bold)
                            }//.listRowBackground(Color.gray)
                            
                        }
                    }header:{
                        Text("Header")
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
