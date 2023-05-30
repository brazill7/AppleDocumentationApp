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
    
    //MARK: - WeatherKit
    @Published var permissionsWeather =
    Data(name: "WeatherKit Permissions",
         sfSymbol: "checkerboard.shield",
         colorNumber: 1,
         description: "",
         example: weatherKitPermissions(),
         image: "",
         imageScaleiOS: 1, imageScaleMacPadOS: 1,
         codeText: "")
    
    @Published var grabWeather =
    Data(name: "Current Weather Data",
         sfSymbol: "cloud",
         colorNumber: 5,
         description: "Using Apple's WeatherKit Library and API we can grab all kinds of weather data, in this example we are grabbing the current weather data.",
         example: currentWeather(),
         image: "currentWeather",
         imageScaleiOS: 0.095, imageScaleMacPadOS: 0.18,
         codeText: currentWeather().code)
    
    @Published var hourlyWeather =
    Data(name: "Hourly Weather Data",
         sfSymbol: "cloud.rain",
         colorNumber: 2,
         description: "We can use a filter modifier to our HourWeather attribute to grab and display each hours individual data by the hour, for as many hours as we specify",
         example: hourWeather(),
         image: "hourWeather",
         imageScaleiOS: 0.1, imageScaleMacPadOS: 0.2,
         codeText: hourWeather().code)
    
    @Published var hourlyWeatherChart =
    Data(name: "Hourly Weather Chart",
         sfSymbol: "chart.xyaxis.line",
         colorNumber: 7,
         description: "Using the same filter method and ForEach loops in the last example 'Hourly Weather Data' we can then pass those values into Swift Charts to display a Chart of our temperatures",
         example: hourWeatherChart(),
         image: "hourlyWeatherChart",
         imageScaleiOS: 0.1, imageScaleMacPadOS: 0.2,
         codeText: hourWeatherChart().code)

    @Published var barChart =
    Data(name: "Bar Chart",
         sfSymbol: "chart.bar",
         colorNumber: 5,
         description: "In this example, the programmed conducted a survey in his workplace and got a tally of everyones favorite seasons, and then input this into a BarChart, with charts there are way too many modifiers for me to cover so I encourage you to go to Apple Developer Documentation and check those out.",
         example: barChartExample(),
         image: "barchart",
         imageScaleiOS: 0.25, imageScaleMacPadOS: 0.5,
         codeText: barChartExample().code)
    
    @Published var lineChart =
    Data(name: "Line Chart",
         sfSymbol: "chart.xyaxis.line",
         colorNumber: 2,
         description: "In this example, we are taking example weather data, and then input this into a Line Chart, with charts there are way too many modifiers for me to cover so I encourage you to go to Apple Developer Documentation and check those out.",
         example: lineChartExample(),
         image: "lineChart",
         imageScaleiOS: 0.20, imageScaleMacPadOS: 0.6,
         codeText: lineChartExample().code)
    
    @Published var pointRectChart =
    Data(name: "Point / Rectangle Chart",
         sfSymbol: "chart.dots.scatter",
         colorNumber: 1,
         description: "With charts there are way too many modifiers for me to cover so I encourage you to go to Apple Developer Documentation and check those out.",
         example: pointRectangleChartExample(),
         image: "pointRect",
         imageScaleiOS: 0.35, imageScaleMacPadOS: 0.7,
         codeText: pointRectangleChartExample().code)
    
    
}


class kitExamplesList: ObservableObject{
    @Published var listData:[kitData] = [
        kitData(name: "MapKit",
                color: Color.brown,
                sfSymbol: "map",
                data: [kits().mapKitImport, kits().mapKitLocation, kits().mapKitAnnotations]),
        
        kitData(name: "Charts",
                color: Color.indigo,
                sfSymbol: "chart.line.flattrend.xyaxis",
                data: [kits().barChart, kits().lineChart, kits().pointRectChart]),
        
        kitData(name: "WeatherKit",
                color: Color.yellow,
                sfSymbol: "cloud.sun",
                data: [kits().permissionsWeather, kits().grabWeather, kits().hourlyWeather, kits().hourlyWeatherChart])

        ]
    
    
    

}
