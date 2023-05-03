//
//  kits.swift
//  betterAppleDocumentation
//
//  Created by Maverick Brazill on 4/19/23.
//

import SwiftUI

//MARK: -Kits
struct kitData: Identifiable{
    var id = UUID()
    var name: String
    var color: Color
    var sfSymbol: String
    var data: [Data]
}

class kits: ObservableObject{
    
    //MARK: -MapKit
    @Published var mapKitImport =
        Data(name: "Creating a Map",
             sfSymbol: "map.circle",
             colorNumber: 1,
             description: "Creating a Map within Xcode is fairly simple, all we need to do is import MapKit at the top of our file, then give the map a Coordinate Region to center on, and a zoom ",
             example: importAMap(),
             image: "importmap", imageScaleiOS: 0.3, imageScaleMacPadOS: 0.6,
             codeText: importAMap().code)
    
    @Published var mapKitLocation =
    Data(name: "Displaying Current Location",
         sfSymbol: "location.fill",
         colorNumber: 4,
         description: "To get a users location, in this example, We import CoreLocationUI, this is a framework that will allow for us to grab the users location data, latitude and longitude\n\nFirst before we do anything we need to go into our projects plist files and enable - Privacy: Location When In Use Description (top photo), and type in an accurate description on why we need the users location data that will be shown to them\n\nWe then set up our map as normal, but set our region to a variable declared in our locationManagerViewModel class, with this we set a default location (in case the user denied permission) and ask for permission to use grab the users coordinates, then set those as our region varible so it updates and displays accurately on the Map\n\nDISCLAIMER: Since this example is embeded in multiple Views and has not been optimized, you may need to click the button a few times, or give it 10 or so seconds to load after tapping/clicking it.",
         example: displayingUserLocation(),
         image: "maplocation", imageScaleiOS: 0.05, imageScaleMacPadOS: 0.1,
         codeText: displayingUserLocation().code)
    
    @Published var mapKitAnnotations =
    Data(name: "Custom Annotations",
         sfSymbol: "pin",
         colorNumber: 3,
         description: "In order to display custom annotations we have to get an array of coordinates, we can then use MapAnnotation to pass in those coordinates and then add whatever we want at those coordinates",
         example: mapAnnotations(),
         image: "mapannotations",
         imageScaleiOS: 0.15, imageScaleMacPadOS: 0.3,
         codeText: "")
    
    
}


class kitExamplesList: ObservableObject{
    @Published var listData:[kitData] = [
        kitData(name: "MapKit",
                color: Color.brown,
                sfSymbol: "map",
                data: [kits().mapKitImport, kits().mapKitLocation, kits().mapKitAnnotations])
        ]

}
