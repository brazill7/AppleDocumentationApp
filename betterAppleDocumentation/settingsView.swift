//
//  settingsView.swift
//  betterAppleDocumentation
//
//  Created by Maverick Brazill on 4/4/23.
//

import SwiftUI

struct settingsView: View {
    @State var localData = appStorage()
    var body: some View {
        VStack{
            HStack{
                Text("Settings")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    
                Spacer()
            }
            Toggle("Description of Uses for Examples", isOn: $localData.description)
                .padding()
            Spacer()
        }.padding()
    }
}

struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        settingsView()
    }
}
