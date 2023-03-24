//
//  listStuff.swift
//  betterAppleDocumentation
//
//  Created by Maverick on 3/17/23.
//

import Foundation
import SwiftUI

struct Data: Identifiable{
    var id = UUID()
    var name: String
    var sfSymbol: String
    var color: Color
    //var height: Int
    var description: String
    var example: any View
    var image: String
    var imageScale: Double
    var overrideImageLocation: Bool
}

class listsData: ObservableObject{
    @Published var listData:[Data] = [
        Data(name: "String Interpolation",
                 sfSymbol: "text.word.spacing",
                 color: Color.teal,
                 description: "String Interpolation is a way of taking an already declared variable and making is usable in a String or Text, The way you Interpolate Strings in Swift is using the syntax backslash(nameOfVariable)",
                 example: AnyView(stringInterpolationExample()),
                image: "stringinterpolation", imageScale: 0.5, overrideImageLocation: false),
        
        Data(name: "Importing Images",
                 sfSymbol: "photo",
                 color: Color.purple,
                 description: "In Xcode you can import any image on your computer and name it, to import a image, you drag a photo into the Assets folder in Xcode, or hit the plus button in the bottom corner of the Assets folder then click import, then call whatever you name the image by using the syntax Image(then in quotes your images name), this example photos name in the Assets folder is puppy",
                 example: AnyView(importingImages()) ,
                image: "importingimages", imageScale: 0.85, overrideImageLocation: false),
        
        Data(name: "Buttons",
                 sfSymbol: "hand.tap",
                 color: Color.green,
                 description: "We can create tappable 'buttons' that when pressed by a user can run any function definined by the programmer, There are 5 button styles we can apply as modifiers to the buttons, shown below (by default the color of a button is blue (except for the plain style (black)) but this can be overrid using .foregroundColor)",
                 example: AnyView(buttonsExample()),
                image: "buttons", imageScale: 0.14,
                 overrideImageLocation: true),
        
        Data(name: "Text Fields",
                 sfSymbol: "text.viewfinder",
                 color: Color.orange,
                 description: "Text Field are a way we can grab input from the user and assign it to a value where we can store and use for future uses, such as asking for their name",
                 example: AnyView(textFieldExample()),
             image: "textfield", imageScale: 0.3,
                 overrideImageLocation: true),
        
        Data(name: "Secure Field",
                 sfSymbol: "lock",
                 color: Color.red,
                 description: "Secure Fields are normally used with passwords and other information you wouldn't want someone to see if they looked over your shoulder, in swift it will just turn all of the characters typed in the field into dots",
                example: AnyView(secureFieldExample()),
             image: "securefield", imageScale: 0.5,
                 overrideImageLocation: false),
        
        Data(name: "Menu",
                 sfSymbol: "filemenu.and.selection",
                 color: Color.indigo,
                 description: "Menus are usually used to copy/paste things, along with sharing and editing certain peramaters on items",
                 example: menuExample(),
                image: "menu", imageScale: 1.0,
                 overrideImageLocation: false),
        
        Data(name: "List",
             sfSymbol: "list.clipboard",
             color: Color.brown,
             description: "",
             example: listExample(),
             image: "", imageScale: 1.0,
             overrideImageLocation: false)
        
        
        
        
            
        
    ]
}




