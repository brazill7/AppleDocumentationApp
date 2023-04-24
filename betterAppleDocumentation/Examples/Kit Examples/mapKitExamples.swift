//
//  mapKitExamples.swift
//  betterAppleDocumentation
//
//  Created by Maverick Brazill on 4/21/23.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct mapAnnotations: View{
    public var code = #"""
import SwiftUI
import MapKit

struct mapAnnotations: View{
    //here i am pre-creating a region for the map to read
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            // if the latitude you want is --.--- degrees South
            // or West, make that number negative
            latitude: 42.3314,
            longitude: -83.0458),
        
        span: MKCoordinateSpan(
            // how zoomed in you want the map as soon as it loads
            // for the first time
            latitudeDelta: 0.035,
            longitudeDelta: 0.035))
    
    let locations = [
        LocationData(name: "Comerica Park",
                     coordinates: CLLocationCoordinate2D(latitude: 42.3390, longitude: -83.0485)),
        LocationData(name: "Apple Developer Academy - Detroit",
                     coordinates: CLLocationCoordinate2D(latitude: 42.3312, longitude: -83.0457))
    ]
    
    var body: some View{
        NavigationView{
            Map(coordinateRegion: $region, annotationItems: locations){ location in
                MapAnnotation(coordinate: location.coordinates){
                    // you can customize any information here and it will show at the coordinates given
                    // this is just what i came up with as an example
                    NavigationLink{
                        Text("\(location.name) is located at \n\nlatitude:\(location.coordinates.latitude)\nlongitude: \(location.coordinates.longitude)")
                            .multilineTextAlignment(.center)
                    }label:{
                        Image(systemName: "pin.circle.fill")
                            .font(.system(size: 20))
                    }
                }
            }
            .frame(width: 400, height: 400)
        }
    }
}

//general blueprint of a data type
struct LocationData: Identifiable{
    let id = UUID()
    var name: String
    var coordinates: CLLocationCoordinate2D
}

"""#
    //here i am pre-creating a region for the map to read
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            // if the latitude you want is --.--- degrees South
            // or West, make that number negative
            latitude: 42.3314,
            longitude: -83.0458),
        
        span: MKCoordinateSpan(
            // how zoomed in you want the map as soon as it loads
            // for the first time
            latitudeDelta: 0.035,
            longitudeDelta: 0.035))
    
    let locations = [
        LocationData(name: "Comerica Park",
                     coordinates: CLLocationCoordinate2D(latitude: 42.3390, longitude: -83.0485)),
        LocationData(name: "Apple Developer Academy - Detroit",
                     coordinates: CLLocationCoordinate2D(latitude: 42.3312, longitude: -83.0457))
    ]
    
    var body: some View{
        NavigationView{
            Map(coordinateRegion: $region, annotationItems: locations){ location in
                MapAnnotation(coordinate: location.coordinates){
                    // you can customize any information here and it will show at the coordinates given
                    // this is just what i came up with as an example
                    NavigationLink{
                        Text("\(location.name) is located at \n\nlatitude:\(location.coordinates.latitude)\nlongitude: \(location.coordinates.longitude)")
                            .multilineTextAlignment(.center)
                    }label:{
                        Image(systemName: "pin.circle.fill")
                            .font(.system(size: 20))
                    }
                }
            }
            .frame(width: 400, height: 400)
        }
    }
}

//general blueprint of a data type
struct LocationData: Identifiable{
    let id = UUID()
    var name: String
    var coordinates: CLLocationCoordinate2D
}






struct displayingUserLocation: View{
    public var code = #"""
import SwiftUI
import MapKit
import CoreLocationUI

struct displayingUserLocation: View{
    
    @StateObject var location = locationManagerViewModel()
    
    var body: some View{
        
        VStack {
            ZStack(alignment: .bottom) {
                Map(coordinateRegion: $location.region, showsUserLocation: true)
                    .frame(width: 400, height: 400)
                
                LocationButton(.currentLocation){
                    location.requestLocationPermissionOnce()
                }
                .symbolVariant(.fill)
                
            }
        }
    }
}

//this class will ask for the permission to get the users location data, and then grab that data
final class locationManagerViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    // this initializes our region value, and gives us a default value incase the
    // user denies location permission
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 40.7128,
            longitude: -74.0060),
        span: MKCoordinateSpan(
            latitudeDelta: 0.3,
            longitudeDelta: 0.3))
    
    let locationManager = CLLocationManager()
    
    override init(){
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocationPermissionOnce(){
        //requests the user for one time location permission
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //this sets the users current Lat/Long as latestLocation
        guard let latestLocation = locations.first else{
            return print("error")
        }
        
        DispatchQueue.main.async {
            //sets the region of our map to the users currentLocation
            self.region = MKCoordinateRegion(center: latestLocation.coordinate,
                                             span: MKCoordinateSpan(
                                                latitudeDelta: 0.3,
                                                longitudeDelta: 0.3))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        //will run if an error occurs
        print(error.localizedDescription)
    }
    
}

"""#
    @StateObject var location = locationManagerViewModel()
    
    var body: some View{
        
        VStack {
            ZStack(alignment: .bottom) {
                Map(coordinateRegion: $location.region, showsUserLocation: true)
                    .frame(width: 400, height: 400)
                
                LocationButton(.currentLocation){
                    location.requestLocationPermissionOnce()
                }
                .symbolVariant(.fill)
                
            }
        }
    }
}

//this class will ask for the permission to get the users location data, and then grab that data
final class locationManagerViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    // this initializes our region value, and gives us a default value incase the
    // user denies location permission
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 40.7128,
            longitude: -74.0060),
        span: MKCoordinateSpan(
            latitudeDelta: 0.3,
            longitudeDelta: 0.3))
    
    let locationManager = CLLocationManager()
    
    override init(){
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocationPermissionOnce(){
        //requests the user for one time location permission
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //this sets the users current Lat/Long as latestLocation
        guard let latestLocation = locations.first else{
            return print("error")
        }
        
        DispatchQueue.main.async {
            //sets the region of our map to the users currentLocation
            self.region = MKCoordinateRegion(center: latestLocation.coordinate,
                                             span: MKCoordinateSpan(
                                                latitudeDelta: 0.3,
                                                longitudeDelta: 0.3))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        //will run if an error occurs
        print(error.localizedDescription)
    }
    
}


struct importAMap: View{
    public var code = #"""
struct importAMap: View{
    //here i am pre-creating a region for the map to read
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            // if the latitude you want is --.--- degrees South
            // or West, make that number negative
            latitude: 42.3314,
            longitude: -83.0458),
        
        span: MKCoordinateSpan(
            // how zoomed in you want the map as soon as it loads
            // for the first time
            latitudeDelta: 0.5,
            longitudeDelta: 0.5))
    
    
    var body: some View{
        
        Map(coordinateRegion: $region)
            .frame(width:400, height: 400)
    }
}
"""#
    //here i am pre-creating a region for the map to read
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            // if the latitude you want is --.--- degrees South
            // or West, make that number negative
            latitude: 42.3314,
            longitude: -83.0458),
        
        span: MKCoordinateSpan(
            // how zoomed in you want the map as soon as it loads
            // for the first time
            latitudeDelta: 0.5,
            longitudeDelta: 0.5))
    
    
    var body: some View{
        
        Map(coordinateRegion: $region, showsUserLocation: false)
            .frame(width:400, height: 400)
    }
}
struct mapKitExamples_Previews: PreviewProvider {
    static var previews: some View {
        mapAnnotations()
    }
}
