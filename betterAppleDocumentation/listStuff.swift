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
    var colorNumber: Int
    //var height: Int
    var description: String
    var example: any View
    var image: String
    var imageScale: Double
 
    func getColor(colors: Int) -> Color{
        switch colorNumber{
        case 1:
            return Color.green
        case 2:
            return Color.orange
        case 3:
            return Color.purple
        case 4:
            return Color.indigo
        case 5:
            return Color.mint
        case 6:
            return Color.yellow
        case 7:
            return Color.red
        case 8:
            return Color.brown
        default:
            return Color.appColorBlack
        }
    }
    
}

class listsData: ObservableObject{
    @Published var listData:[Data] = [
        Data(name: "Alerts",
             sfSymbol: "exclamationmark.triangle",
             colorNumber: 7,
             description: "Alerts can be used to emphasize important messages or warnings",
             example: alertsExample(),
             image: "alerts", imageScale: 0.4),
        
        Data(name: "Buttons",
                 sfSymbol: "hand.tap",
                colorNumber: 1,
                description: "We can create tappable 'buttons' that when pressed by a user can run any function definined by the programmer, There are 5 button styles we can apply as modifiers to the buttons, shown below (by default the color of a button is blue (except for the plain style (black)) but this can be overrid using .foregroundColor)",
                 example: AnyView(buttonsExample()),
                 image: "buttons", imageScale: 0.14),
        
        Data(name: "Color Picker",
             sfSymbol: "paintpalette",
             colorNumber: 8,
             description: "With this you can allow a user to pick a color and use this color in any way you please, common uses could include changing the color of the UI or other personalized colors, but beware everytime the view reloads so will the color they picked, unless you use appstorage",
             example: colorPickerExample(),
             image: "colorpicker", imageScale: 0.33),
        
        Data(name: "Date Picker",
             sfSymbol: "calendar",
             colorNumber: 6,
             description: "",
             example: datePickerExample(),
             image: "datepicker", imageScale: 0.28),
        
        Data(name: "Importing Images",
                 sfSymbol: "photo",
             colorNumber: 2, description: "In Xcode you can import any image on your computer and name it, to import a image, you drag a photo into the Assets folder in Xcode, or hit the plus button in the bottom corner of the Assets folder then click import, then call whatever you name the image by using the syntax Image(then in quotes your images name), this example photos name in the Assets folder is puppy",
                 example: AnyView(importingImages()) ,
                 image: "importingimages", imageScale: 0.85),
        
        Data(name: "List",
                sfSymbol: "list.clipboard",
             colorNumber: 3, description: "Lists are very common and provide a way to easily show off an array of items, Apple makes it very easy to intgrate deleting items off the list, and moving the items in the list around. Aswell as those actions you can also use the .listStyle modifier to change how your lists look",
                example: listWorkAround(),
                image: "lists", imageScale: 0.3),
        
        Data(name: "Menu",
                 sfSymbol: "filemenu.and.selection",
                 colorNumber: 4,
                 description: "Menus are usually used to copy/paste things, along with sharing and editing certain peramaters on items",
                 example: menuExample(),
                 image: "menu", imageScale: 0.48),
        
        Data(name: "Pickers",
             sfSymbol: "checklist",
             colorNumber: 5,
             description: "Pickers are a simple way of being able to display a lot of options for a user to click on, to either customize their experience, or enter in information such as age",
             example: pickerExample(),
             image: "picker", imageScale: 0.35),
        
        Data(name: "Tab View",
             sfSymbol: "platter.2.filled.iphone.landscape",
             colorNumber: 2,
             description: "Tab Views allow users to easily switch between different views by just hitting an icon on the bottom of the screen, the most common example of this is social media apps",
             example: tabViewExample(),
             image: "tabview", imageScale: 0.3),
        
        Data(name: "Text Fields",
                 sfSymbol: "text.viewfinder",
                 colorNumber: 6,
                 description: "Text Field are a way we can grab input from the user and assign it to a value where we can store and use for future uses, such as asking for their name",
                 example: AnyView(textFieldExample()),
                image: "textfield", imageScale: 0.3),
        
        Data(name: "Secure Field",
                 sfSymbol: "lock",
                 colorNumber: 7,
                 description: "Secure Fields are normally used with passwords and other information you wouldn't want someone to see if they looked over your shoulder, in swift it will just turn all of the characters typed in the field into dots",
                example: secureFieldExample(),
                image: "securefield", imageScale: 0.48),
        
        Data(name: "Sheets",
             sfSymbol: "menubar.arrow.up.rectangle",
             colorNumber: 8,
             description: "Sheets can be pulled up from the bottom of the screen and pop up a different view, to dismiss the sheet the user can swipe down, or you can create a simple dismiss button",
             example: sheetExample(),
             image: "sheets", imageScale: 0.4),
        
        Data(name: "String Interpolation",
                 sfSymbol: "text.word.spacing",
                 colorNumber: 1,
                 description: "String Interpolation is a way of taking an already declared variable and making is usable in a String or Text, The way you Interpolate Strings in Swift is using the syntax backslash(nameOfVariable)",
                 example: stringInterpolationExample(),
             image: "stringinterpolation", imageScale: 0.5),
        
    ]
}




