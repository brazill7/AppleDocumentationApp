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
    var description: String
    var example: any View
    var image: String
    var imageScale: Double
    var codeText: String
 
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

class nativeComponentsList: ObservableObject{
    @Published var listData:[Data] = [
        Data(name: "Alerts",
             sfSymbol: "exclamationmark.triangle",
             colorNumber: 7,
             description: "Alerts can be used to emphasize important messages or warnings",
             example: alertsExample(),
             image: "alerts", imageScale: 0.4,
             codeText: alertsExample().code),
        
        Data(name: "Buttons",
                 sfSymbol: "hand.tap",
                colorNumber: 1,
                description: "We can create tappable 'buttons' that when pressed by a user can run any function definined by the programmer, There are 5 button styles we can apply as modifiers to the buttons, shown below (by default the color of a button is blue (except for the plain style (black)) but this can be overrid using .foregroundColor)",
                 example: buttonsExample(),
             image: "buttons", imageScale: 0.14,
             codeText: buttonsExample().code),
        
        Data(name: "Color Picker",
             sfSymbol: "paintpalette",
             colorNumber: 8,
             description: "With this you can allow a user to pick a color and use this color in any way you please, common uses could include changing the color of the UI or other personalized colors, but beware everytime the view reloads so will the color they picked, unless you use appstorage",
             example: colorPickerExample(),
             image: "colorpicker", imageScale: 0.33,
             codeText: colorPickerExample().code),
        
        Data(name: "Date Picker",
             sfSymbol: "calendar",
             colorNumber: 6,
             description: "This allows users to use the calendar to select a single date",
             example: datePickerExample(),
             image: "datepicker", imageScale: 0.28,
             codeText: datePickerExample().code),
        
        Data(name: "Date Picker (Multiple)",
             sfSymbol: "calendar.badge.plus",
             colorNumber: 5,
             description: "This can allow users to select multiple dates, which could be used for creating events, scheduling appointments etc...",
             example: datePickerMultipleExample(),
             image: "datepickermulti", imageScale: 0.32,
             codeText: datePickerMultipleExample().code),
        
        Data(name: "ForEach",
             sfSymbol: "arrow.triangle.2.circlepath",
             colorNumber: 1,
             description: "",
             example: forEachExample(),
             image: "foreach", imageScale: 0.2,
             codeText: forEachExample().code),
        
        Data(name: "Full-Screen Sheet",
             sfSymbol: "square.and.arrow.up.on.square",
             colorNumber: 4,
             description: "The main difference between Full-Screen Sheet and a normal Sheet, is the fact that with a Full-Screen Sheet you cannot just pull the view down to dismiss the view, only when the view is dismissed",
             example: fullScreenSheetExample(),
             image: "fullscreensheet", imageScale: 0.3,
             codeText: fullScreenSheetExample().code),
        
        Data(name: "Gauge",
             sfSymbol: "gauge.low",
             colorNumber: 2,
             description: "Gauges can be used to show a user progress, such as account creation, survey progeess, or progress through a level in a game, or many other uses. Along with Gauges comes a handful of Gauge Styles",
             example: gaugeExample(),
             image: "gauge", imageScale: 0.4,
             codeText: gaugeExample().code),
        
        Data(name: "Geometry Reader",
             sfSymbol: "aspectratio",
             colorNumber: 8,
             description: "Geometry Reader scans the device the user is using and allows the Programmer to code without having to worry about device sizes, with Geometry Reader you can place things depeding on the users screen dimensions, and change the width or height of shapes in order to conform to the smaller or larger screen size",
             example: geometryReaderExample(),
             image: "geometryreader", imageScale: 0.35,
             codeText: geometryReaderExample().code),
        
        Data(name: "Gradients",
             sfSymbol: "scribble.variable",
             colorNumber: 1,
             description: "Gradients show a gradual change from one color, to another, they can help add more detail to a view, or shape",
             example: gradientExample(),
             image: "gradient", imageScale: 0.12,
             codeText: gradientExample().code),
        
        Data(name: "Importing Images",
                 sfSymbol: "photo",
             colorNumber: 2, description: "In Xcode you can import any image on your computer and name it, to import a image, you drag a photo into the Assets folder in Xcode, or hit the plus button in the bottom corner of the Assets folder then click import, then call whatever you name the image by using the syntax Image(then in quotes your images name), this example photos name in the Assets folder is puppy",
                 example: importingImages() ,
             image: "importingimages", imageScale: 0.85,
             codeText: importingImages().code),
        
        Data(name: "Links",
             sfSymbol: "link",
             colorNumber: 7,
             description: "Links are buttons that travel to a specified URL through safari when clicked",
             example: linkExample(),
             image: "link", imageScale: 0.4,
             codeText: linkExample().code),
        
        Data(name: "List",
                sfSymbol: "list.clipboard",
             colorNumber: 3, description: "Lists are very common and provide a way to easily show off an array of items, Apple makes it very easy to intgrate deleting items off the list, and moving the items in the list around. Aswell as those actions you can also use the .listStyle modifier to change how your lists look",
                example: listWorkAround(),
             image: "lists", imageScale: 0.3,
             codeText: listExample().code),
        
        Data(name: "Menu",
                 sfSymbol: "filemenu.and.selection",
                 colorNumber: 4,
                 description: "Menus are usually used to copy/paste things, along with sharing and editing certain peramaters on items",
                 example: menuExample(),
             image: "menu", imageScale: 0.48,
             codeText: menuExample().code),
        
        Data(name: "Navigation Link / View",
             sfSymbol: "rectangle.portrait.and.arrow.right",
             colorNumber: 1,
             description: "Navigation Links are buttons that allow you to travel from one view to a different view\n\n CAUTION:\nA navigation link must be in a NaviagtionView{ } in order for it to work properly, the view will then transition from the first view to the linked view, ONLY FOR THE NAVIAGATION VIEW, objects outside the navigation view will not change",
             example: navigationLinkView(),
             image: "navigationlink", imageScale: 0.35,
             codeText: navigationLinkView().code),
        
        Data(name: "Pickers",
             sfSymbol: "checklist",
             colorNumber: 5,
             description: "Pickers are a simple way of being able to display a lot of options for a user to click on, to either customize their experience, or enter in information such as age",
             example: pickerExample(),
             image: "picker", imageScale: 0.35,
             codeText: pickerExample().code),
        
        Data(name: "Progress View",
             sfSymbol: "circle.dotted",
             colorNumber: 3,
             description: "Progress Views can be shown to show the user that data is still loading, and can show how much of certain data is downloaded, and how much is left.",
             example: progressViewExample(),
             image: "progressview", imageScale: 0.3,
             codeText: progressViewExample().code),
        
        Data(name: "Raw Strings",
             sfSymbol: "character",
             colorNumber: 1,
             description: "Raw strings allow you to show any text including escape sequences that wouldn't normally show, the syntax is a # before and after any string quotation marks",
             example: rawStringExample(),
             image: "rawstrings", imageScale: 0.6,
             codeText: rawStringExample().code),
        
        Data(name: "Secure Field",
                 sfSymbol: "lock",
                 colorNumber: 7,
                 description: "Secure Fields are normally used with passwords and other information you wouldn't want someone to see if they looked over your shoulder, in swift it will just turn all of the characters typed in the field into dots",
                example: secureFieldExample(),
             image: "securefield", imageScale: 0.48,
             codeText: secureFieldExample().code),
        
        Data(name: "Shapes",
             sfSymbol: "square",
             colorNumber: 4,
             description: "Swift makes it easy to implement shapes into your code, aswell as an option to create custom shapes from scratch using Path()",
             example: shapeExample(),
             image: "shape", imageScale: 0.15,
             codeText: shapeExample().code),
        
        Data(name: "Sheets",
             sfSymbol: "menubar.arrow.up.rectangle",
             colorNumber: 8,
             description: "Sheets can be pulled up from the bottom of the screen and pop up a different view, to dismiss the sheet the user can swipe down, or you can create a simple dismiss button",
             example: sheetExample(),
             image: "sheets", imageScale: 0.4,
             codeText: sheetExample().code),
        
        Data(name: "Slider",
             sfSymbol: "slider.horizontal.below.rectangle",
             colorNumber: 2,
             description: "Sliders are an easy way to get an input for a value in an easy way for the user to interpret and use just by the swipe of their finger",
             example: sliderExample(),
             image: "slider", imageScale: 0.37,
             codeText: sliderExample().code),
        
        Data(name: "Stepper",
             sfSymbol: "plus.forwardslash.minus",
             colorNumber: 4,
             description: "A stepper can be used to incriment numbers in an easy + or - view, common uses include age, and zoom",
             example: stepperExample(),
             image: "stepper", imageScale: 0.3,
             codeText: stepperExample().code),
        
        Data(name: "String Interpolation",
                 sfSymbol: "text.word.spacing",
                 colorNumber: 1,
                 description: "String Interpolation is a way of taking an already declared variable and making is usable in a String or Text, The way you Interpolate Strings in Swift is using the syntax backslash(nameOfVariable)",
                 example: stringInterpolationExample(),
             image: "stringinterpolation", imageScale: 0.5,
             codeText: stringInterpolationExample().code),
        
        Data(name: "Tab View",
             sfSymbol: "platter.2.filled.iphone.landscape",
             colorNumber: 2,
             description: "Tab Views allow users to easily switch between different views by just hitting an icon on the bottom of the screen, the most common example of this is social media apps",
             example: tabViewExample(),
             image: "tabview", imageScale: 0.3,
             codeText: tabViewExample().code),
        
        Data(name: "Ternary Operators",
             sfSymbol: "questionmark",
             colorNumber: 3,
             description: "Ternary Operators are a way for you to display information based on if a value is true or false, they are commonly used as replacements for if else statements.\n\nThe sytax is: ((bool == condition) ? (will occur if () returns true) : (will occur if () returns false)\n\n(bool) ? (true) : (false)",
             example: ternaryOperatorExample(),
             image: "ternary", imageScale: 0.4,
             codeText: ternaryOperatorExample().code),
        
        Data(name: "Text Editor",
             sfSymbol: "text.viewfinder",
             colorNumber: 7,
             description: "A Text Editor is essentially a multiline TextField that can also be used to edit and change existing text",
             example: textEditorExample(),
             image: "texteditor", imageScale: 0.4,
             codeText: textEditorExample().code),
        
        Data(name: "Text Fields",
                 sfSymbol: "character.textbox",
                 colorNumber: 6,
                 description: "Text Field are a way we can grab input from the user and assign it to a value where we can store and use for future uses, such as asking for their name",
                 example: textFieldExample(),
             image: "textfield", imageScale: 0.6,
             codeText: textFieldExample().code),
        
        Data(name: "Toggle",
             sfSymbol: "switch.2",
             colorNumber: 3,
             description: "Toggles are like on/off switches that we can use in a multiple of different ways, common examples include Show Advanced Options, Show Password(on SecureFields to remove the privacy dots), Closed Captioning, etc...",
             example: toggleExample(),
             image: "toggle", imageScale: 0.5,
             codeText: toggleExample().code)
        
    ]
}




