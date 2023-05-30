//
//  weatherKitExamples.swift
//  betterAppleDocumentation
//
//  Created by Maverick Brazill on 5/5/23.
//

import SwiftUI
import CoreLocation
import WeatherKit
import Charts

struct weatherKitPermissions: View{
    var body: some View{
        ScrollView {
            ScrollView{
                Text("In order to get started with WeatherKit there are a lot of permissions we have to enable on Xcode, and Apple Developer, this is because we are accessing Apple's API data\n\nFirst lets get started on Apple Developer, first we have to sign in, then go to Account, then go to Certificated, IDs and Profiles, then click on Identifiers and click on the app you want to enable WeatherKit on, you'll see two tabs\n(Image #1 Capabilities, Image #2 App Services), under both we need to checkmark WeatherKit, then click save")
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Image 1: Capabilities")
                    .fontWeight(.bold)
                Image("weatherPerm2")
                    .resizable()
                    .frame(width:400, height:400)
                
                Spacer(minLength: 80)
                Text("Image 2: App Services")
                    .fontWeight(.bold)
                Image("weatherPerm1")
                    .resizable()
                    .frame(width:400, height: 400)
                Spacer(minLength: 80)
                
                Text("After we enable these permissions it may take some time for your account to be verified to be able to use WeatherKit, so your code may still print an error for up to 2 days after enabling\n\nNow we move over to Xcode, where we have to again in 2 places enable WeatherKit Permissions")
                    .multilineTextAlignment(.center)
                    .padding()
                
                Image("weatherPerm3")
                    .resizable()
                    .frame(width:400, height: 400)
                
                Text("After you click on your project file you will find a screen that looks like this, you will have to click the plus button by capabilites (green circle) scroll down and then find WeatherKit, after you select and add it it should appear at the bottom (red circle)\n\n After all of these things are enabled, and you are verified for WeatherKit use, you are good to go, if you still need help there are some very good YouTube videos online explaining all of this")
                    .multilineTextAlignment(.center)
                    .padding()
            }
            ScrollView{
                Image("weatherPerm4")
                    .resizable()
                    .frame(width:400, height: 400)
            }
        }
    }
}





//MARK: - Our Weather View
struct currentWeather: View {
    @State var code = #"""
//MARK: -grabs user location
class LocationManager: NSObject, ObservableObject{
    @Published var currentLocation: CLLocation?
    private let locationManager = CLLocationManager()
    
    override init(){
        super.init()
        //we want the best location accuracy
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //says that all movement will be recorded, even short distances
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
}
                            
extension LocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last, currentLocation == nil else { return }
        
        DispatchQueue.main.async {
            self.currentLocation = location
        }
    }
}


//MARK: - Our Weather View
struct currentWeather: View {
    @StateObject private var locationManager = LocationManager()
    let weatherService = WeatherService.shared
    @State private var weather: Weather?
    @State private var precip: Precipitation?
    
    
    private func getWeather() async {
        do{
            //if we have the users location, grab weather data for the location
            if let location = locationManager.currentLocation{
            self.weather = try await weatherService.weather(for: location)
            }
        } catch {
            //if we dont have access, print an error
            print(error)
        }
    }
    
    func reloadWeather(){
        Task{
            await getWeather()
        }
    }
    
    
    var body: some View {
        VStack{
            Text("* Make sure to view WeatherKit Permissions First")
                .fontWeight(.black)
                .foregroundColor(.red)
                .padding()
            //only is allowed to load if we have weather data to display
            if let weather = weather{
                Text("Current Weather Data")
                    .font(.title)
                    .fontWeight(.black)
                HStack {
                    Button{
                        reloadWeather()
                    }label:{
                        Image(systemName: "arrow.clockwise")
                            .resizable()
                            .frame(width:12, height:12)
                    }
                    Text("Weather Data as of: \(weather.currentWeather.date.formatted(date: .abbreviated, time: .shortened))")
                }
                //MARK: - Weather Condition and Temperature
                Text("\(Image(systemName: weather.currentWeather.symbolName)) \(weather.currentWeather.temperature.formatted())")
                        .font(.system(.largeTitle))
                        .padding()
                
                ///
                Text("Feels Like: \(weather.currentWeather.apparentTemperature.formatted() )")
                ///
                Text("Condition: \(weather.currentWeather.condition.description)")
                ///
                Text("Cloud Cover: \(weather.currentWeather.cloudCover.formatted(.percent))")
                ///
                Text("Wind: \(weather.currentWeather.wind.speed.formatted()) \(weather.currentWeather.wind.compassDirection.abbreviation)")
                    .padding()
                Text("* There is more data you can pull, this is just all I am pulling for the example")
                    

            }else{
                VStack{
                    ProgressView()
                    Text("Sometimes the data won't load, or takes a a few seconds")
                }
            }
        }.task(id: locationManager.currentLocation) {
            //grabs the weather data for the current location
            do{
                if let location = locationManager.currentLocation{
                self.weather = try await weatherService.weather(for: location)
                }
            } catch {
                print(error)
            }
            
        }
    }
}
"""#
    
    @StateObject private var locationManager = LocationManager()
    let weatherService = WeatherService.shared
    @State private var weather: Weather?
    @State private var precip: Precipitation?
    @State var locationError = false
    
    private func getWeather() async {
        do{
            //if we have the users location, grab weather data for the location
            if let location = locationManager.currentLocation{
            self.weather = try await weatherService.weather(for: location)
            }
        } catch {
            //if we dont have access, print an error
            print(error)
        }
    }
    
    func reloadWeather(){
        Task{
            await getWeather()
        }
    }
    
    
    var body: some View {
        VStack{
            Text("* Make sure to view WeatherKit Permissions First")
                .fontWeight(.black)
                .foregroundColor(.red)
                .padding()
            //only is allowed to load if we have weather data to display
            if let weather = weather{
                Text("Current Weather Data")
                    .font(.title)
                    .fontWeight(.black)
                HStack {
                    Button{
                        reloadWeather()
                    }label:{
                        Image(systemName: "arrow.clockwise")
                            .resizable()
                            .frame(width:12, height:12)
                    }
                    Text("Weather Data as of: \(weather.currentWeather.date.formatted(date: .abbreviated, time: .shortened))")
                }
                //MARK: - Weather Condition and Temperature
                Text("\(Image(systemName: weather.currentWeather.symbolName)) \(weather.currentWeather.temperature.formatted())")
                        .font(.system(.largeTitle))
                        .padding()
                
                ///
                Text("Feels Like: \(weather.currentWeather.apparentTemperature.formatted() )")
                ///
                Text("Condition: \(weather.currentWeather.condition.description)")
                ///
                Text("Cloud Cover: \(weather.currentWeather.cloudCover.formatted(.percent))")
                ///
                Text("Wind: \(weather.currentWeather.wind.speed.formatted()) \(weather.currentWeather.wind.compassDirection.abbreviation)")
                    .padding()
                Text("* There is more data you can pull, this is just all I am pulling for the example")
                    

            }else{
                VStack{
                    ProgressView()
                    Text("Sometimes the data won't load, or takes a a few seconds")
                    Spacer(minLength: 30)
                    if locationError{
                        Text("There was an error with grabbing your location, make sure location services are enabled and you gave our app the correct permissions, if those are enabled it is also possible there is a problem on Apple's side, try again later")
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                    }
                }.padding()
            }
        }.task(id: locationManager.currentLocation) {
            //grabs the weather data for the current location
            do{
                if let location = locationManager.currentLocation{
                self.weather = try await weatherService.weather(for: location)
                }
            } catch {
                print(error)
                locationError = true
            }
            
        }
    }
}

import SwiftUI
import CoreLocation
import WeatherKit
import Charts


//MARK: -grabs user location
class LocationManager: NSObject, ObservableObject{
    @Published var currentLocation: CLLocation?
    private let locationManager = CLLocationManager()
    
    
    
    override init(){
        super.init()
        //we want the best location accuracy
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //says that all movement will be recorded, even short distances
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
}
                            
extension LocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last, currentLocation == nil else { return }
        
        DispatchQueue.main.async {
            self.currentLocation = location
        }
    }
}

struct hourWeather: View{
    @StateObject private var locationManager = LocationManager()
    let weatherService = WeatherService.shared
    @State private var weather: Weather?
    @State var locationError = false
    
    
    public var code = #"""
import SwiftUI
import CoreLocation
import WeatherKit
import Charts


//MARK: -grabs user location
class LocationManager: NSObject, ObservableObject{
    @Published var currentLocation: CLLocation?
    private let locationManager = CLLocationManager()
    
    override init(){
        super.init()
        //we want the best location accuracy
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //says that all movement will be recorded, even short distances
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
}
                            
extension LocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last, currentLocation == nil else { return }
        
        DispatchQueue.main.async {
            self.currentLocation = location
        }
    }
}

struct hourWeather: View{
    @StateObject private var locationManager = LocationManager()
    let weatherService = WeatherService.shared
    @State private var weather: Weather?
    @State var locationError = false
    
    var weatherDataForTheHour: [HourWeather] {
        if let weather {
            return Array(weather.hourlyForecast.filter { hourlyWeather in
                return hourlyWeather.date.timeIntervalSince(Date()) >= 0
            }.prefix(1))
            //prefix is hour many hours you want to display
        } else {
            return []
        }
    }
    
    var hourlyWeatherData: [HourWeather] {
        if let weather {
            return Array(weather.hourlyForecast.filter { hourlyWeather in
                return hourlyWeather.date.timeIntervalSince(Date()) >= 0
            }.prefix(24))
            //prefix is hour many hours you want to display
        } else {
            return []
        }
    }
    
    
    
    var body: some View{
        VStack{
            if weather != nil{
                ForEach(weatherDataForTheHour, id: \.date) { hourWeatherItem in
                    VStack{
                        Text("Precipitation chance for the hour: \(hourWeatherItem.precipitationChance.formatted(.percent))")
                        Text("Precipitation for the hour: \(hourWeatherItem.precipitationAmount.formatted())")
                    }
                }.padding(.bottom, 50)
                
                ForEach(hourlyWeatherData, id: \.date){ hourlyWeatherItem in
                    HStack{
                        Text("Temperature at \(hourlyWeatherItem.date.formatted(date: .omitted, time: .shortened)): \(hourlyWeatherItem.temperature.formatted())")
                        Text(Image(systemName: hourlyWeatherItem.symbolName))
                    }
                }
                
            }else{
                VStack{
                    ProgressView()
                    Text("Sometimes the data won't load, or takes a a few seconds")
                    Spacer(minLength: 30)
                    if locationError{
                        Text("There was an error with grabbing your location, make sure location services are enabled and you gave our app the correct permissions, if those are enabled it is also possible there is a problem on Apple's side, try again later")
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                    }
                }.padding()
            }
        }.task(id: locationManager.currentLocation) {
            //grabs the weather data for the current location
            do{
                if let location = locationManager.currentLocation{
                self.weather = try await weatherService.weather(for: location)
                }
            } catch {
                print(error)
                locationError = true
            }
            
        }
    }
}
"""#
    var weatherDataForTheHour: [HourWeather] {
        if let weather {
            return Array(weather.hourlyForecast.filter { hourlyWeather in
                return hourlyWeather.date.timeIntervalSince(Date()) >= 0
            }.prefix(1))
            //prefix is hour many hours you want to display
        } else {
            return []
        }
    }
    
    var hourlyWeatherData: [HourWeather] {
        if let weather {
            return Array(weather.hourlyForecast.filter { hourlyWeather in
                return hourlyWeather.date.timeIntervalSince(Date()) >= 0
            }.prefix(24))
            //prefix is hour many hours you want to display
        } else {
            return []
        }
    }
    
    
    
    var body: some View{
        VStack{
            if weather != nil{
                ForEach(weatherDataForTheHour, id: \.date) { hourWeatherItem in
                    VStack{
                        Text("Precipitation chance for the hour: \(hourWeatherItem.precipitationChance.formatted(.percent))")
                        Text("Precipitation for the hour: \(hourWeatherItem.precipitationAmount.formatted())")
                    }
                }.padding(.bottom, 50)
                
                ForEach(hourlyWeatherData, id: \.date){ hourlyWeatherItem in
                    HStack{
                        Text("Temperature at \(hourlyWeatherItem.date.formatted(date: .omitted, time: .shortened)): \(hourlyWeatherItem.temperature.formatted())")
                        Text(Image(systemName: hourlyWeatherItem.symbolName))
                    }
                }
                
            }else{
                VStack{
                    ProgressView()
                    Text("Sometimes the data won't load, or takes a a few seconds")
                    Spacer(minLength: 30)
                    if locationError{
                        Text("There was an error with grabbing your location, make sure location services are enabled and you gave our app the correct permissions, if those are enabled it is also possible there is a problem on Apple's side, try again later")
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                    }
                }.padding()
            }
        }.task(id: locationManager.currentLocation) {
            //grabs the weather data for the current location
            do{
                if let location = locationManager.currentLocation{
                self.weather = try await weatherService.weather(for: location)
                }
            } catch {
                print(error)
                locationError = true
            }
            
        }
    }
}



struct hourWeatherChart: View{
    @StateObject private var locationManager = LocationManager()
    let weatherService = WeatherService.shared
    @State private var weather: Weather?
    @State var locationError = false

    public var code = #"""
import SwiftUI
import CoreLocation
import WeatherKit
import Charts


//MARK: -grabs user location
class LocationManager: NSObject, ObservableObject{
    @Published var currentLocation: CLLocation?
    private let locationManager = CLLocationManager()
    
    override init(){
        super.init()
        //we want the best location accuracy
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //says that all movement will be recorded, even short distances
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
}
                            
extension LocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last, currentLocation == nil else { return }
        
        DispatchQueue.main.async {
            self.currentLocation = location
        }
    }
}


struct hourWeatherChart: View{
    @StateObject private var locationManager = LocationManager()
    let weatherService = WeatherService.shared
    @State private var weather: Weather?
    @State var locationError = false

    var hourlyWeatherData: [HourWeather] {
        if let weather {
            return Array(weather.hourlyForecast.filter { hourlyWeather in
                return hourlyWeather.date.timeIntervalSince(Date()) >= 0
            }.prefix(24))
            //prefix is hour many hours you want to display
        } else {
            return []
        }
    }
    
    
    var body: some View{
        VStack{
            if let weather = weather{
                VStack {
                    ZStack{
                        Chart {
                            ForEach(hourlyWeatherData.prefix(24), id: \.date) {hourlyWeather in
                                AreaMark(x: .value("Hour", hourlyWeather.date, unit: .hour), y: .value("Temp", hourlyWeather.temperature.converted(to: .fahrenheit).value))
                                    .foregroundStyle(.purple.opacity(0.4))
                                    //.alignsMarkStylesWithPlotArea()
                                    

                            }
                        }.chartXAxis(.hidden)
                            //.chartYAxisLabel("test")
                        Chart {
                            ForEach(hourlyWeatherData.prefix(24), id: \.date) {hourlyWeather in
                                LineMark(x: .value("Hour", hourlyWeather.date, unit: .hour), y: .value("Temp", hourlyWeather.temperature.converted(to: .fahrenheit).value))
                                    .foregroundStyle(.purple)
                            }
                        }.chartXAxis(.hidden)
                            //.chartYAxisLabel("test")
                    }
                    Text("24 Hour Temperature Outlook")
                        .fontWeight(.bold)
                        .foregroundColor(.appColorBlack)
                }
            }else{
                VStack{
                    ProgressView()
                    Text("Sometimes the data won't load, or takes a a few seconds")
                    Spacer(minLength: 30)
                    if locationError{
                        Text("There was an error with grabbing your location, make sure location services are enabled and you gave our app the correct permissions, if those are enabled it is also possible there is a problem on Apple's side, try again later")
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                    }
                }.padding()
            }
        }.task(id: locationManager.currentLocation) {
            //grabs the weather data for the current location
            do{
                if let location = locationManager.currentLocation{
                self.weather = try await weatherService.weather(for: location)
                }
            } catch {
                print(error)
                locationError = true
            }
            
        }
    }
}
"""#
    var hourlyWeatherData: [HourWeather] {
        if let weather {
            return Array(weather.hourlyForecast.filter { hourlyWeather in
                return hourlyWeather.date.timeIntervalSince(Date()) >= 0
            }.prefix(24))
            //prefix is hour many hours you want to display
        } else {
            return []
        }
    }
    
    
    var body: some View{
        VStack{
            if let weather = weather{
                VStack {
                    ZStack{
                        Chart {
                            ForEach(hourlyWeatherData.prefix(24), id: \.date) {hourlyWeather in
                                AreaMark(x: .value("Hour", hourlyWeather.date, unit: .hour), y: .value("Temp", hourlyWeather.temperature.converted(to: .fahrenheit).value))
                                    .foregroundStyle(.purple.opacity(0.4))
                                    //.alignsMarkStylesWithPlotArea()
                                    

                            }
                        }.chartXAxis(.hidden)
                            //.chartYAxisLabel("test")
                        Chart {
                            ForEach(hourlyWeatherData.prefix(24), id: \.date) {hourlyWeather in
                                LineMark(x: .value("Hour", hourlyWeather.date, unit: .hour), y: .value("Temp", hourlyWeather.temperature.converted(to: .fahrenheit).value))
                                    .foregroundStyle(.purple)
                            }
                        }.chartXAxis(.hidden)
                            //.chartYAxisLabel("test")
                    }
                    Text("24 Hour Temperature Outlook")
                        .fontWeight(.bold)
                        .foregroundColor(.appColorBlack)
                }
            }else{
                VStack{
                    ProgressView()
                    Text("Sometimes the data won't load, or takes a a few seconds")
                    Spacer(minLength: 30)
                    if locationError{
                        Text("There was an error with grabbing your location, make sure location services are enabled and you gave our app the correct permissions, if those are enabled it is also possible there is a problem on Apple's side, try again later")
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                    }
                }.padding()
            }
        }.task(id: locationManager.currentLocation) {
            //grabs the weather data for the current location
            do{
                if let location = locationManager.currentLocation{
                self.weather = try await weatherService.weather(for: location)
                }
            } catch {
                print(error)
                locationError = true
            }
            
        }
    }
}



struct weatherKitExamples_Previews: PreviewProvider {
    static var previews: some View {
        hourWeather()
    }
}
