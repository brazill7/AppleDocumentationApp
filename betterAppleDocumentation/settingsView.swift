//
//  settingsView.swift
//  betterAppleDocumentation
//
//  Created by Maverick Brazill on 4/4/23.
//

import SwiftUI

struct settingsView: View {
    @Environment(\.dismiss) var dismiss: DismissAction
    @State var localData = appStorage()
    
    func toggleSidebar() {
           #if os(iOS)
           #else
            NSApp.sendAction(#selector(NSSplitViewController.toggleSidebar(_:)), to: nil, from: nil)
           #endif

        }
    
    var body: some View {
        VStack(alignment: .leading) {
            if UIDevice.current.userInterfaceIdiom == .phone{
                Button{
                    dismiss()
                }label:{
                    Text("\(Image(systemName: "arrow.left")) Back")
                }.padding()
            }
            VStack{
                HStack{
                    /// header
                    Text("Settings")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        
                        
                    Spacer()
                }
                /// description of uses
                Toggle("Description of Uses for Examples", isOn: $localData.description)
                    .padding()
                /// link to survey

                   Link("Suggest Additions  \(Image(systemName: "link"))", destination: URL(string: "https://forms.gle/GGKykgipBAUJegiT7")!)
                        .buttonStyle(.borderedProminent)

                NavigationLink{
                    tipView()
                }label:{
                    Text("\(Image(systemName: "heart")) Tip")
                }.buttonStyle(.borderedProminent)
                Spacer()
            
                
            }.toolbar({
                if UIDevice.current.userInterfaceIdiom == .phone{
                    return .hidden
                }else{
                    return .visible
                }
            }())
            .toolbar(content: {
                if UIDevice.current.userInterfaceIdiom == .phone{
                    
                }else{
                    Button{
                        toggleSidebar()
                    }label:{
                        
                    }
                }
            })
                .padding()
        }
        
    }
}

struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        settingsView()
    }
}
