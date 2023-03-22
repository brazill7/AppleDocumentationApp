//
//  listStuff.swift
//  betterAppleDocumentation
//
//  Created by Maverick Brazill on 3/17/23.
//

import Foundation
import SwiftUI

struct listTest: Identifiable{
    var id = UUID()
    var name: String
    var sfSymbol: String
    var color: Color
    var height: Int
    //var destination: Int
    
    var description: String
    var example: any View
    var image: String
    var imageHeight: Int
    var overrideImageLocation: Bool
    //var codeDescription: String?
}

class listsData: ObservableObject{
    @Published var listData:[listTest] = [
        listTest(name: "String Interpolation",
                 sfSymbol: "text.word.spacing",
                 color: Color.teal,
                 height: 250,
                 description: "String Interpolation is a way of taking an already declared variable and making is usable in a String or Text, The way you Interpolate Strings in Swift is using the syntax backslash(nameOfVariable)",
                 example: AnyView(stringInterpolationExample()),
                 image: "stringinterpolation", imageHeight: 200, overrideImageLocation: false),
        
        listTest(name: "Importing Images",
                 sfSymbol: "photo",
                 color: Color.purple,
                 height: 300,
                 description: "In Xcode you can import any image on your computer and name it, to import a image, you drag a photo into the Assets folder in Xcode, or hit the plus button in the bottom corner of the Assets folder then click import, then call whatever you name the image by using the syntax Image(then in quotes your images name), this example photos name in the Assets folder is puppy",
                 example: AnyView(importingImages()) ,
                 image: "importingimages", imageHeight: 200, overrideImageLocation: false),
        
        listTest(name: "Buttons",
                 sfSymbol: "hand.tap",
                 color: Color.green,
                 height: 400,
                 description: "In swift we can create tappable 'buttons' that when pressed by a user can run any function definined by the programmer, There are 5 button styles we can apply as modifiers to the buttons, shown below (by default the color of a button is blue (except for the plain style (black)) but this can be overrid using .foregroundColor)",
                 example: AnyView(buttonsExample()),
                 image: "buttons", imageHeight: 800,
                 overrideImageLocation: true),
        
        listTest(name: "Text Fields",
                 sfSymbol: "text.viewfinder",
                 color: Color.orange,
                 height: 400,
                 description: "Text Field are a way we can grab input from the user and assign it to a value where we can store and use for future uses, such as asking for their name",
                 example: AnyView(textFieldExample()),
                 image: "textfield", imageHeight: 500,
                 overrideImageLocation: true),
        
        listTest(name: "Secure Field",
                 sfSymbol: "lock",
                 color: Color.red,
                 height: 300,
                 description: "Secure Fields are normally used with passwords and other information you wouldn't want someone to see if they looked over your shoulder, in swift it will just turn all of the characters typed in the field into dots",
                 example: AnyView(secureFieldExample()),
                 image: "securefield", imageHeight: 250,
                 overrideImageLocation: false)
        
        
            
        
    ]
}




