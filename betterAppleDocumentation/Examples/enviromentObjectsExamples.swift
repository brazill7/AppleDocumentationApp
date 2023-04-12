//
//  enviromentObjectsExamples.swift
//  betterAppleDocumentation
//
//  Created by Maverick Brazill on 4/7/23.
//

import SwiftUI


struct darkLightModeExamlple: View{
    @Environment(\.colorScheme) var colorScheme
    var body: some View{
        VStack {
            //see ternary operators
            Text((colorScheme == .light) ? "Light Mode Detected" : "Dark Mode Detected")
            
            Rectangle()
                .foregroundColor((colorScheme == .light) ? Color.green : Color.red)
                .frame(width: 300, height: 300)
            
            if (colorScheme == .light){
                Circle()
                    .frame(width:200, height: 200)
            }
            
        }
    }
}



struct enviromentObjectsExamples_Previews: PreviewProvider {
    static var previews: some View {
        darkLightModeExamlple()
    }
}
