//
//  exampleViews.swift
//  betterAppleDocumentation
//
//  Created by Maverick on 3/20/23.
//
import SwiftUI

// MARK: -String Interpolation
struct stringInterpolationExample: View{
    var profileName = "Andy"
    var age = "18"
    @State public var code = #"""
    struct stringInterpolationExample: View{
        var profileName = "Andy"
        var age = "18"
        
        var body: some View{
            VStack {
                Text("Hello my name is \(profileName)")
                    .padding()
                Text("I am \(age)")
            }
            
        }
    }
    """#
    
    var body: some View{
        VStack {
            Text("Hello my name is \(profileName)")
                .padding()
            Text("I am \(age)")
        }
        
    }
}
// MARK: -Importing Images
struct importingImages: View{
    @State public var code = #"""
    struct importingImages: View{
        var body: some View{
            Image("puppy")
                .resizable()
                .scaledToFit()
        }
    }
    """#
    var body: some View{
        Image("puppy")
            .resizable()
            .scaledToFit()
    }
}

// MARK: -Alerts
struct alertsExample: View{
    @State private var showingAlert = false
    @State public var code = #"""
    struct alertsExample: View{
        @State private var showingAlert = false
        var body: some View{
            Button("Show Alert"){
                showingAlert.toggle()
            }.alert("Alert Title", isPresented: $showingAlert){
                Button("Not Good", role: .destructive) {
                    //optional function can go here
                }
                Button("Ok sounds good", role: .cancel) {
                    //optional function can go here
                }
            }
        }
    }
    """#
    var body: some View{
        Button("Show Alert"){
            self.showingAlert.toggle()
        }.alert("Alert Title", isPresented: $showingAlert){
            Button("Not Good", role: .destructive) {
                //optional function can go here
            }
            Button("Ok sounds good", role: .cancel) {
                //optional function can go here
            }
        }
    }
}

// MARK: -Buttons
struct buttonsExample: View{
    @State var counter = 0
    @State var colorSwitch = false
    @State var currentColor = Color.green
    @State var secondColor = Color.blue
    @State public var code = #"""
struct buttonsExample: View{
    @State var counter = 0
    @State var colorSwitch = false
    @State var currentColor = Color.green
    @State var secondColor = Color.blue
    
    var body: some View{
        VStack {
            ///automatic
            Button{
                counter += 1
            }label:{
                Text("Automatic Button Style\nTap me and the counter will go up: \(counter)")
                    .multilineTextAlignment(.center)
            }.buttonStyle(.automatic)
                .padding()
            
            ///borderless
            Button{
                colorSwitch.toggle()
            }label:{
               Text("Borderless Button Style\nClick me to change color")
                    .foregroundColor(colorSwitch ? secondColor : currentColor)
                    .multilineTextAlignment(.center)
            }.buttonStyle(.borderless)
                .padding()
            
            ///plain
            Button{
                counter -= 1
            }label:{
               Text("Plain Button Style\nTap me and the counter will go down: \(counter)")
                    .multilineTextAlignment(.center)
    
            }.buttonStyle(.plain)
                .padding()
            
            ///bordered
            Button{
                counter *= 2
            }label:{
               Text("Bordered Button Style\nTap me and the counter will multiply by 2: \(counter)")
                    .multilineTextAlignment(.center)
    
            }.buttonStyle(.bordered)
                .padding()
            ///borderedProminent
            Button{
                counter /= 2
            }label:{
               Text("Bordered Prominent Button Style\nTap me and the counter will divide by 2: \(counter)")
                    .multilineTextAlignment(.center)
    
            }.buttonStyle(.borderedProminent)
                .padding()
        }
        
        
    }
}
"""#
    
    var body: some View{
        VStack {
            ///automatic
            Button{
                self.counter += 1
            }label:{
                Text("Automatic Button Style\nTap me and the counter will go up: \(counter)")
                    .multilineTextAlignment(.center)
            }.buttonStyle(.automatic)
                .padding()
            
            ///borderless
            Button{
                self.colorSwitch.toggle()
            }label:{
               Text("Borderless Button Style\nClick me to change color")
                    .foregroundColor(colorSwitch ? secondColor : currentColor)
                    .multilineTextAlignment(.center)
            }.buttonStyle(.borderless)
                .padding()
            
            ///plain
            Button{
                self.counter -= 1
            }label:{
               Text("Plain Button Style\nTap me and the counter will go down: \(counter)")
                    .multilineTextAlignment(.center)
    
            }.buttonStyle(.plain)
                .padding()
            
            ///bordered
            Button{
                self.counter *= 2
            }label:{
               Text("Bordered Button Style\nTap me and the counter will multiply by 2: \(counter)")
                    .multilineTextAlignment(.center)
    
            }.buttonStyle(.bordered)
                .padding()
            ///borderedProminent
            Button{
                self.counter /= 2
            }label:{
               Text("Bordered Prominent Button Style\nTap me and the counter will divide by 2: \(counter)")
                    .multilineTextAlignment(.center)
    
            }.buttonStyle(.borderedProminent)
                .padding()
        }
        
        
    }
}
// MARK: -Color Picker
struct colorPickerExample: View{
    @State private var selectedColor = Color.purple
    @State public var code = #"""
struct colorPickerExample: View{
    @State private var selectedColor = Color.purple
    
    var body: some View{
        VStack {
            Text("This text is in whatever color you select")
                .multilineTextAlignment(.center)
                .foregroundColor(selectedColor)
            ColorPicker("Change the color", selection: $selectedColor)
                .border(Color.red)
        }
    }
}
"""#
    var body: some View{
        VStack {
            Text("This text is in whatever color you select")
                .multilineTextAlignment(.center)
                .foregroundColor(selectedColor)
            ColorPicker("Change the color", selection: $selectedColor)
                .border(Color.red)
        }
    }
}
//MARK: -Date Picker
struct datePickerExample: View{
    @State private var selectedDate = Date.now // can be any date, acts as a placeholder
                                               // until the user selects their date
    private let styles: [MyDatePickerStyle] = [
            MyDatePickerStyle(.automatic),
            MyDatePickerStyle(.compact),
            MyDatePickerStyle(.wheel),
            MyDatePickerStyle(.graphical)
        ]
    @State private var selectedStyle = MyDatePickerStyle(.automatic)
    @State public var code = #"""
    struct datePickerExample: View{
        @State private var selectedDate = Date.now // can be any date, acts as a placeholder
                                                   // until the user selects their date
        var body: some View{
            VStack{
                    DatePicker(selection: $selectedDate,
                               in: ...Date.now, // this can be any range, if you want it to go all
                // the way back in time, type "...(endTime)", if you want from now until forevever
                // just do the opposite "Date.now..."
                                                
                               displayedComponents: .date){ //what users have the option to choose
                        Text("Select a date")
                    }.datePickerStyle(.automatic)
                
                Text("Selected Date is\n \(selectedDate.formatted(date: .long, time: .omitted))")
                    
            }
        }
    }
    """#
    
    var body: some View{
        VStack{
            HStack {
                Text("Date Picker Style:")
                Picker("Choose a list style", selection: $selectedStyle){
                        ForEach(styles, id: \.self) { style in
                            Text(style.name).tag(style)
                    }
                }
            }
            AnyView(
                DatePicker(selection: $selectedDate,
                           in: ...Date.now, // this can be any range, if you want it to go all
            // the way back in time, type "...(endTime)", if you want from now until forevever
            // just do the opposite "Date.now..."
                                            
                           displayedComponents: .date){ //what users have the option to choose
                    Text("Select a date")
                }.datePickerStyle(selectedStyle.style)
            )
            
            Text("Selected Date is\n \(selectedDate.formatted(date: .long, time: .omitted))")
                
        }
    }
}
struct MyDatePickerStyle: Equatable, Hashable{
    let style: any DatePickerStyle

    var name: String {
        var name = String(describing: style)
        let index = name.range(of: "DatePickerStyle")?.lowerBound
        if let index { name.removeSubrange(index...) }
        return name
    }

    init(_ style: any DatePickerStyle) {
        self.style = style
    }

    static func == (lhs: MyDatePickerStyle, rhs: MyDatePickerStyle) -> Bool {
        lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

//MARK: -Date Picker (Multiple)
struct datePickerMultipleExample: View{
    @Environment(\.calendar) var calendar
    @State var dates: Set<DateComponents> = []
    @State public var code = #"""
struct datePickerMultipleExample: View{
    @Environment(\.calendar) var calendar
    @State var dates: Set<DateComponents> = []

    var selectedDates: String{
        dates.compactMap{ components in
            calendar.date(from: components)?.formatted(date: .long, time: .omitted)
        }.formatted()
    }
    
    var body: some View{
        VStack{
            MultiDatePicker("Pick Dates", selection: $dates)
            Text(selectedDates)
        }.padding()
    }
}
"""#
    var selectedDates: String{
        dates.compactMap{ components in
            calendar.date(from: components)?.formatted(date: .long, time: .omitted)
        }.formatted()
    }
    
    var body: some View{
        VStack{
            MultiDatePicker("Pick Dates", selection: $dates)
            Text(selectedDates)
        }.padding()
    }
}
// MARK: -Geometry Reader
struct geometryReaderExample: View{
    @State var num: CGFloat = 0
    @State public var code = #"""
struct geometryReaderExample: View{
    @State var num: CGFloat = 0
    
    var body: some View{
        GeometryReader{ geometry in
            VStack(alignment: .center) {
                Text("Rectangle with the size of half the screen")
                
                VStack {
                    Rectangle()
                        .frame(width: (geometry.size.width/2), height: 200)
                        .foregroundColor(Color.blue)
                }
                
                //setting the position of the view determined by the geometry reader
            }.position(x: geometry.frame(in: .local).midX, y: 150)
        }
    }
}
"""#
    
    var body: some View{
        GeometryReader{ geometry in
            VStack(alignment: .center) {
                Text("Rectangle with the size of half the screen")
                
                VStack {
                    Rectangle()
                        .frame(width: (geometry.size.width/2), height: 200)
                        .foregroundColor(Color.blue)
                }
                
                //setting the position of the view determined by the geometry reader
            }.position(x: geometry.frame(in: .local).midX, y: 150)
        }
    }
}

// MARK: -Text Fields
struct textFieldExample: View{
    @State var data: String = ""
    @FocusState private var isFocused
    @State var submit: Bool = false
    @State public var code = #"""
struct textFieldExample: View{
    @State var data: String = ""
    @FocusState private var isFocused
    @State var submit: Bool = false
    
    var body: some View{
        TextField("Enter Data Here", text: $data)
            .multilineTextAlignment(.center)
            .border(Color.appColorBlack)
        
            //sets isFocused to true when a user is typing in the TextField
            .focused($isFocused)
        
            .onSubmit {
                //runs when the user hits enter
                submit = true
            }
        /// other modifications you can add include
            // .textInputAutocapitalization(.never)
                //(makes it to where the TextField doesnt Autocapitalize words)
        
            // .disableAutocorrection(true)
                // disables autocorrect for the TextField
        if submit && !isFocused{
            Text("You entered \(data)")
        }
        
    }
}
"""#
    
    var body: some View{
        TextField("Enter Data Here", text: $data)
            .multilineTextAlignment(.center)
            .border(Color.appColorBlack)
        
            //sets isFocused to true when a user is typing in the TextField
            .focused($isFocused)
        
            .onSubmit {
                //runs when the user hits enter
                submit = true
            }
        /// other modifications you can add include
            // .textInputAutocapitalization(.never)
                //(makes it to where the TextField doesnt Autocapitalize words)
        
            // .disableAutocorrection(true)
                // disables autocorrect for the TextField
        if submit && !isFocused{
            Text("You entered \(data)")
        }
        
    }
}

// MARK: -Secure Field
struct secureFieldExample: View{
    @State private var username = ""
    @State private var password = ""
    @State public var code = #"""
struct secureFieldExample: View{
    @State private var username = ""
    @State private var password = ""
    
    var body: some View{
        TextField("Fake Username", text: $username)
            .autocorrectionDisabled()
            .multilineTextAlignment(.center)
            .border(Color.appColorBlack)
        SecureField("Fake Password", text: $password)
            .multilineTextAlignment(.center)
            .border(Color.appColorBlack)
            
    }
}
"""#
    var body: some View{
        TextField("Fake Username", text: $username)
            .autocorrectionDisabled()
            .multilineTextAlignment(.center)
            .border(Color.appColorBlack)
        SecureField("Fake Password", text: $password)
            .multilineTextAlignment(.center)
            .border(Color.appColorBlack)
            
    }
}
// MARK: -Stepper Example
struct stepperExample: View{
    @State var num1 = 0
    @State var num2 = 0
    @State public var code = #"""
struct stepperExample: View{
    @State var num1 = 0
    @State var num2 = 0
    
    var body: some View{
        VStack {
            Stepper("Incriment Number", value: $num1, in: 0...100)
            Text("Current number is \(num1)")
            
            Spacer()
            
            Stepper("Custom Increment", onIncrement: {num2 += 2}, onDecrement: {num2 -= 2})
            Text("Current number is \(num2)")
            
        }
    }
}
"""#
    
    var body: some View{
        VStack {
            Stepper("Incriment Number", value: $num1, in: 0...100)
            Text("Current number is \(num1)")
            
            Spacer()
            
            Stepper("Custom Increment", onIncrement: {num2 += 2}, onDecrement: {num2 -= 2})
            Text("Current number is \(num2)")
            
        }.padding()
    }
}

// MARK: -Menu Example
struct menuExample: View{
    @State public var code = #"""
struct menuExample: View{
    func void(){
        /* you can run any function when this button
         is pressed, common examples include copy/paste
         or share */
    }
    var body: some View{
        Menu("Clickable Menu"){
            Button("You can click me", action: void)
            Text("You cannot click me")
            
            Menu("Submenu"){
                Button("You can click me", action: void)
                Text("You cannot click me")
            }
        }
    }
}
"""#
    func void(){
        /* you can run any function when this button
         is pressed, common examples include copy/paste
         or share */
    }
    var body: some View{
        Menu("Clickable Menu"){
            Button("You can click me", action: void)
            Text("You cannot click me")
            
            Menu("Submenu"){
                Button("You can click me", action: void)
                Text("You cannot click me")
            }
        }
    }
}
// MARK: -List Example
struct listExample: View{
    @State private var exampleArr = ["a", "b", "c", "d", "e"]
    @State public var code = #"""
struct listExample: View{
    @State private var exampleArr = ["a", "b", "c", "d", "e"]
    
    var body: some View{
            VStack {
                EditButton()
                    .multilineTextAlignment(.center)
                    List{
                        ForEach(exampleArr, id: \.self){ example in
                            Text(example)
                        }
                        /// onDelete and onMove need EditButton() to function
                        //creates a performable action when you hit the delete button
                        .onDelete(perform: { exampleArr.remove(atOffsets: $0)})
                        //creates an action that allows you to move the items in the list
                        .onMove(perform: {exampleArr.move(fromOffsets: $0, toOffset: $1)})
                        
                        //creates an action when u swipe from a specified edge
                        .swipeActions(edge: .trailing, allowsFullSwipe: true){
                            Button{
                                //function goes here
                            }label:{
                                Image(systemName: "trash")
                            }
                        }
                    }
                        .listStyle(.automatic)
            }.padding()
        

    }
}
"""#
    
    private let styles: [MyListStyle] = [
            MyListStyle(.grouped),
            MyListStyle(.inset),
            MyListStyle(.insetGrouped),
            MyListStyle(.plain),
            MyListStyle(.sidebar)
        ]
    @State private var selectedList = MyListStyle(.plain)
    
    var body: some View{
        GeometryReader { geo in
            VStack {
                EditButton()
                    .multilineTextAlignment(.center)
                HStack {
                    Text("List Style:")
                    Picker("Choose a list style", selection: self.$selectedList){
                        ForEach(self.styles, id: \.self) { style in
                                Text(style.name).tag(style)
                        }
                    }
                }
                
                AnyView(
                    List{
                        ForEach(self.exampleArr, id: \.self){ example in
                            Text(example)
                        }
                        /// onDelete and onMove need EditButton() to function
                        //creates a performable action when you hit the delete button
                        .onDelete(perform: { self.exampleArr.remove(atOffsets: $0)})
                        //creates an action that allows you to move the items in the list
                        .onMove(perform: {self.exampleArr.move(fromOffsets: $0, toOffset: $1)})
                        
                        //creates an action when u swipe from a specified edge
                        .swipeActions(edge: .trailing, allowsFullSwipe: true){
                            Button{
                                //function goes here
                            }label:{
                                Image(systemName: "trash")
                            }
                        }
                    }.frame(width: geo.size.width, height: 800)
                        .listStyle(self.selectedList.style)
                )
            }.padding()
        }

    }
}
struct MyListStyle: Equatable, Hashable {
    let style: any ListStyle

    var name: String {
        // All names contain "ListStyle" and we want the part before that.
        var name = String(describing: style)
        let index = name.range(of: "ListStyle")?.lowerBound
        if let index { name.removeSubrange(index...) }
        return name
    }

    init(_ style: any ListStyle) {
        self.style = style
    }

    static func == (lhs: MyListStyle, rhs: MyListStyle) -> Bool {
        lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
struct listWorkAround: View{
    @State var test = false
    
    var body: some View{
        
        GeometryReader { geo in
            VStack {
                Button{
                    test.toggle()
                }label:{
                    Text("Click me for list example")
                        .position(x: geo.size.width/2 )
                }
            }.sheet(isPresented: $test){
                listExample()
            }
        }
    }
}
// MARK: -Picker Example

struct pickerExample: View{
    @State var favoriteNumber = 0
    @State var dataList = [0,1,2,3,4,5,6,7,8,9,10]
    @State private var selectedPicker = MyPickerStyle(.automatic)
    @State public var code = #"""
struct pickerExample: View{
    @State var favoriteNumber = 0
    @State var dataList = [0,1,2,3,4,5,6,7,8,9,10]
    
    var body: some View{
        VStack {
            HStack {
                Text("Choose your favorite number from 1-10")
                AnyView (
                    Picker("Favorite Number", selection: $favoriteNumber){
                        ForEach(dataList, id:\.self){
                            Text($0.description)
                        }
                    }
                    .border(.pink)
                    .pickerStyle(.automatic)
                )
            }
            Text("You selected \(favoriteNumber)")
        }
    }
}
"""#
    private let styles: [MyPickerStyle] = [
        MyPickerStyle(.automatic),
        MyPickerStyle(.navigationLink),
        MyPickerStyle(.inline),
        MyPickerStyle(.menu),
        MyPickerStyle(.segmented),
        MyPickerStyle(.wheel)
        ]

    var body: some View{
        VStack {
            HStack {
                Text("Choose a picker style:")
                Picker("Choose a picker style", selection: $selectedPicker){
                    ForEach(styles, id: \.self) { style in
                        Text(style.name)
                    }
                }
            }
            HStack {
                Text("Choose your favorite number from 1-10")
                AnyView (
                    Picker("Favorite Number", selection: $favoriteNumber){
                        ForEach(dataList, id:\.self){
                            Text($0.description)
                        }
                    }
                    .border(.pink)
                .pickerStyle(selectedPicker.picker)
                )
            }
            Text("You selected \(favoriteNumber)")
        }
    }
}
struct MyPickerStyle: Equatable, Hashable {
    let picker: any PickerStyle

    var name: String {
        var name = String(describing: picker)
        let index = name.range(of: "PickerStyle")?.lowerBound
        if let index { name.removeSubrange(index...) }
        return name
    }

    init(_ style: any PickerStyle) {
        self.picker = style
    }

    static func == (lhs: MyPickerStyle, rhs: MyPickerStyle) -> Bool {
        lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
// MARK: -Tab View

struct tabViewExample: View{
    @State public var code = #"""
struct tabViewExample: View{
    var body: some View{
        TabView{
            tabItemOne()
                .tabItem{
                    Label("Tab 1", systemImage: "1.circle")
                }
            tabItemTwo()
                .tabItem{
                    Label("Tab 2 with badge", systemImage: "2.circle")
                }.badge(1)
            
        }.frame(width: 300, height: 400)
        .border(Color.red)
    }
}

struct tabItemOne: View{
    var body: some View{
        Text("First View")
    }
}
struct tabItemTwo: View{
    var body: some View{
        Text("Second View")
    }
}
"""#
    var body: some View{
        TabView{
            tabItemOne()
                .tabItem{
                    Label("Tab 1", systemImage: "1.circle")
                }
            tabItemTwo()
                .tabItem{
                    Label("Tab 2 with badge", systemImage: "2.circle")
                }.badge(1)
            
        }.frame(width: 300, height: 400)
        .border(Color.red)
    }
}

struct tabItemOne: View{
    var body: some View{
        Text("First View")
    }
}
struct tabItemTwo: View{
    var body: some View{
        Text("Second View")
    }
}

//MARK: -Text Editor
struct textEditorExample: View{
    @State private var text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
    @State public var code = #"""
struct textEditorExample: View{
    @State private var text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
    
    var body: some View{
        TextEditor(text: $text)
            .frame(width: 400, height: 400)
            .border(Color.pink)
            .opacity(0.6)
    }
"""#
    var body: some View{
        TextEditor(text: $text)
            .frame(width: 400, height: 400)
            .border(Color.pink)
            .opacity(0.6)
    }
}

//MARK: -Toggle Example

struct toggleExample: View{
    @State private var isToggleOn = false
    @State public var code = #"""
struct toggleExample: View{
    @State private var isToggleOn = false
    
    var body: some View{
        VStack{
            Toggle("Button Toggle", isOn: $isToggleOn)
                .toggleStyle(.button)
            Toggle("Switch Toggle", isOn: $isToggleOn)
                .toggleStyle(.switch)
            
            if isToggleOn{
                Text("Toggle is on")
            }
        }.padding()
    }
}
"""#
    var body: some View{
        VStack{
            Toggle("Button Toggle", isOn: $isToggleOn)
                .toggleStyle(.button)
            Toggle("Switch Toggle", isOn: $isToggleOn)
                .toggleStyle(.switch)
            
            if isToggleOn{
                Text("Toggle is on")
            }
        }.padding()
    }
}
//MARK: -Slider Example

struct sliderExample: View{
    @State public var code = #"""
struct sliderExample: View{
    @State var num = 0.0
    var body: some View{
        VStack {
            Slider(value: $num, in: -100...100)
            Text(num.rounded().description) // .description turns the
                                    // value from an int to a string
        }
    }
}
"""#
    @State var num = 0.0
    var body: some View{
        VStack {
            Slider(value: $num, in: -100...100)
            Text(num.rounded().description) // .description turns the
                                    // value from an int to a string
        }
    }
}


// MARK: -Sheets Example

struct sheetExample: View{
    @State var isShowingSheet = false
    @State public var code = #"""
struct sheetExample: View{
    @State var isShowingSheet = false
    
    var body: some View{
        VStack {
            Button{
                isShowingSheet.toggle()
            }label:{
                Text("Toggle Sheet")
            }
        }.sheet(isPresented: $isShowingSheet){
            //View that shows up on the sheet
            Text("Sheet stuff")
            Button{
                isShowingSheet = false
            }label:{
                Text("Dismiss")
            }
        }
    }
}
"""#
    var body: some View{
        VStack {
            Button{
                isShowingSheet.toggle()
            }label:{
                Text("Toggle Sheet")
            }
        }.sheet(isPresented: $isShowingSheet){
            //View that shows up on the sheet
            Text("Sheet stuff")
            Button{
                isShowingSheet = false
            }label:{
                Text("Dismiss")
            }
        }
    }
}

// MARK: -Raw Strings
struct rawStringExample: View{
    @State var text = "hello world"
    @State public var code = #"""
struct rawStringExample: View{
    @State var text = "hello world"
    var body: some View{
        VStack {
            Text("The text is \(text)")
            Text(#"The text is \(text)"#)
        }
    }
}
"""#
    var body: some View{
        VStack {
            Text("The text is \(text)")
            Text(#"The text is \(text)"#)
        }
    }
}

//MARK: -ProgressView
struct progressViewExample: View{
    @State var count = 0.0
    
    //this uses the users clock to publish an update every second
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State public var code = #"""
struct progressViewExample: View{
    @State var count = 0.0
    
    //this uses the users clock to publish an update every second
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View{
        VStack {
            Text("Circular Progress")
            ProgressView()
                .progressViewStyle(.circular)
            Spacer()
            Text("Linear Progress")
            ProgressView("Downloading...", value: count, total: 100)
                .progressViewStyle(.linear)
        }.padding()
        
        //this function recieves the update and then performs the function
        .onReceive(timer) { _ in
                if count < 100 {
                    count += 2
                }
            }
    }
}
"""#
    
    var body: some View{
        VStack {
            Text("Circular Progress")
            ProgressView()
                .progressViewStyle(.circular)
            Spacer()
            Text("Linear Progress")
            ProgressView("Downloading...", value: count, total: 100)
                .progressViewStyle(.linear)
        }.padding()
        
        //this function recieves the update and then performs the function
        .onReceive(timer) { _ in
                if count < 100 {
                    count += 2
                }
            }
    }
}
// MARK: -Gauge Example

struct gaugeExample: View{
    @State var value = 0.0
    @State var selectedStyle = MyGaugeStyle(.automatic)
    private let styles: [MyGaugeStyle] = [
        MyGaugeStyle(.automatic),
        MyGaugeStyle(.accessoryCircular),
        MyGaugeStyle(.accessoryCircularCapacity),
        MyGaugeStyle(.linearCapacity),
        MyGaugeStyle(.accessoryLinear),
        MyGaugeStyle(.accessoryLinearCapacity)
        ]
    @State public var code = #"""
struct gaugeExample: View{
    @State var value = 0.0
    
    var body: some View{
        VStack {
            Stepper("Value", value: $value, in: 0...10)
            
            Gauge(value: value, in: 0...10){
                Text("")
            }currentValueLabel: {
                Text("Current Value: \(Int(value))")
            }minimumValueLabel: {
                Text("0%")
            }maximumValueLabel: {
                Text("100%")
            }.gaugeStyle(.automatic)
                .tint((value > 5) ? Color.green : Color.red)
    
        }.padding()
    }
}
"""#
    var body: some View{
        VStack {
            HStack{
                Text("Gauge Style:")
                Picker("Choose a picker style", selection: $selectedStyle){
                    ForEach(styles, id: \.self) { style in
                        Text(style.name)
                    }
                }
            }
            Stepper("Value", value: $value, in: 0...10)
           AnyView(
            Gauge(value: value, in: 0...10){
                    Text("top text")
                }currentValueLabel: {
                    Text("Current Value: \(Int(value))")
                }minimumValueLabel: {
                    Text("0%")
                }maximumValueLabel: {
                    Text("100%")
                }.gaugeStyle(self.selectedStyle.picker)
                
            )
                    
            
    
        }.padding()
    }
}
struct MyGaugeStyle: Equatable, Hashable{
    
    let picker: any GaugeStyle

    var name: String {
        var name = String(describing: picker)
        let index = name.range(of: "GaugeStyle")?.lowerBound
        if let index { name.removeSubrange(index...) }
        return name
    }

    init(_ style: any GaugeStyle) {
        self.picker = style
    }

    static func == (lhs: MyGaugeStyle, rhs: MyGaugeStyle) -> Bool {
        lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
// MARK: -Gradients
struct gradientExample: View{
    @State var code = #"""
struct gradientExample: View{
    var body: some View{
        VStack(alignment: .trailing) {
            HStack {
                //Gradient in a Background
                Text("Background of \nan Object:")
                    .multilineTextAlignment(.trailing)
                Text("Hello World")
                    .background{
                        LinearGradient(colors: [.green, .yellow], startPoint: .leading, endPoint: .trailing)
                }
            }
            //Angluar Gradient, Square/Rectangle
            HStack {
                Text("Angluar Gradient: ")
                AngularGradient(colors: [.red,.blue,.green, .orange, .red], center: .center)
                    .frame(width:100, height: 100)
            }
            //Anglular Gradient, Circle
            HStack{
                Text("Angular Gradient\nIn a Circle:")
                    .multilineTextAlignment(.trailing)
                Circle()
                    .fill(
                        AngularGradient(colors: [.red,.orange,.yellow,.green,.blue,.purple, .red], center: .center)
                    )
                    .frame(width: 100, height: 100)
            }
            // Radial Gradient, Square/Rectangle
            HStack{
                Text("Radial Gradient: ")
                RadialGradient(colors: [.cyan, .green, .red, .purple, .yellow], center: .center, startRadius: 10, endRadius: 70)
                    .frame(width:100, height: 100)
            }
            //Radial Gradient, Circle
            HStack{
                Text("Radial Gradient\nIn a Circle :")
                    .multilineTextAlignment(.trailing)
                Circle()
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]), center: .center, startRadius: 1, endRadius: 50)
                    )
                    .frame(width: 100, height: 100)
            }
            //Angular Gradient, Donut
            HStack{
                Text("Angular Gradient\nIn a Donut:")
                    .multilineTextAlignment(.trailing)
               Circle()
                    .strokeBorder(
                        AngularGradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .red], center: .center),
                        lineWidth: 25
                    )
                    .frame(width:100, height:100)
            }
            //Radial Gradint, Donut
            HStack{
                Text("Radial Gradient\nIn a Donut:")
                    .multilineTextAlignment(.trailing)
                Circle()
                    .strokeBorder(
                        RadialGradient(colors: [.red,.orange,.yellow,.green,.blue,.purple], center: .center, startRadius: 50, endRadius: 25),
                        lineWidth: 25
                    )
                    .frame(width:100, height:100)
            }
        }.padding()
    }
}

"""#
    var body: some View{
        VStack(alignment: .trailing) {
            HStack {
                //Gradient in a Background
                Text("Background of \nan Object:")
                    .multilineTextAlignment(.trailing)
                Text("Hello World")
                    .foregroundColor(.black)
                    .background{
                        LinearGradient(colors: [.green, .yellow], startPoint: .leading, endPoint: .trailing)
                }
            }
            //Angluar Gradient, Square/Rectangle
            HStack {
                Text("Angluar Gradient: ")
                AngularGradient(colors: [.red,.blue,.green, .orange, .red], center: .center)
                    .frame(width:100, height: 100)
            }
            //Anglular Gradient, Circle
            HStack{
                Text("Angular Gradient\nIn a Circle:")
                    .multilineTextAlignment(.trailing)
                Circle()
                    .fill(
                        AngularGradient(colors: [.red,.orange,.yellow,.green,.blue,.purple, .red], center: .center)
                    )
                    .frame(width: 100, height: 100)
            }
            // Radial Gradient, Square/Rectangle
            HStack{
                Text("Radial Gradient: ")
                RadialGradient(colors: [.cyan, .green, .red, .purple, .yellow], center: .center, startRadius: 10, endRadius: 70)
                    .frame(width:100, height: 100)
            }
            //Radial Gradient, Circle
            HStack{
                Text("Radial Gradient\nIn a Circle :")
                    .multilineTextAlignment(.trailing)
                Circle()
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]), center: .center, startRadius: 1, endRadius: 50)
                    )
                    .frame(width: 100, height: 100)
            }
            //Angular Gradient, Donut
            HStack{
                Text("Angular Gradient\nIn a Donut:")
                    .multilineTextAlignment(.trailing)
               Circle()
                    .strokeBorder(
                        AngularGradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .red], center: .center),
                        lineWidth: 25
                    )
                    .frame(width:100, height:100)
            }
            //Radial Gradint, Donut
            HStack{
                Text("Radial Gradient\nIn a Donut:")
                    .multilineTextAlignment(.trailing)
                Circle()
                    .strokeBorder(
                        RadialGradient(colors: [.red,.orange,.yellow,.green,.blue,.purple], center: .center, startRadius: 50, endRadius: 25),
                        lineWidth: 25
                    )
                    .frame(width:100, height:100)
            }
        }.padding()
    }
}
//MARK: -Shapes
struct shapeExample: View{
    @State public var code = #"""
struct shapeExample: View{
    var body: some View{
        VStack(alignment: .leading){
            //Capsule
            HStack {
                Text("Capsule: ")
                Capsule()
                    .frame(width: 150, height: 60)
                    .foregroundColor(.purple)
            }
            //Elipse
            HStack{
                Text("Elipse: ")
                Ellipse()
                    .frame(width:150, height: 60)
                    .foregroundColor(.blue)
            }
            //Circle
            HStack{
                Text("Circle: ")
                Circle()
                    .frame(width:100, height: 100)
                    .foregroundColor(.green)
            }
            //Rounded Rectangle
            HStack{
                Text("Rounded\nRectangle: ")
                RoundedRectangle(cornerRadius: 10)
                    .frame(width:150, height: 60)
                    .foregroundColor(.yellow)
            }
            
            //Rectangle
            HStack{
                Text("Rectangle: ")
                Rectangle()
                    .frame(width: 150, height: 60)
                    .foregroundColor(.orange)
            }
            //Custom Shapes
            HStack{
                Text("Custom Triangle\nusing Path: ")
                Path{ path in
                    path.move(to: CGPoint(x: 50, y: 50))
                    path.addLine(to: CGPoint(x: 100, y: 100))
                    path.addLine(to: CGPoint(x: 0, y: 100))
                    path.addLine(to: CGPoint(x: 50, y: 50))
                }.frame(width:100, height: 100)
                    .foregroundColor(.red)
            }
            

        }
    }
}
"""#
    var body: some View{
        VStack(alignment: .leading){
            //Capsule
            HStack {
                Text("Capsule: ")
                Capsule()
                    .frame(width: 150, height: 60)
                    .foregroundColor(.purple)
            }
            //Elipse
            HStack{
                Text("Elipse: ")
                Ellipse()
                    .frame(width:150, height: 60)
                    .foregroundColor(.blue)
            }
            //Circle
            HStack{
                Text("Circle: ")
                Circle()
                    .frame(width:100, height: 100)
                    .foregroundColor(.green)
            }
            //Rounded Rectangle
            HStack{
                Text("Rounded\nRectangle: ")
                RoundedRectangle(cornerRadius: 10)
                    .frame(width:150, height: 60)
                    .foregroundColor(.yellow)
            }
            
            //Rectangle
            HStack{
                Text("Rectangle: ")
                Rectangle()
                    .frame(width: 150, height: 60)
                    .foregroundColor(.orange)
            }
            //Custom Shapes
            HStack{
                Text("Custom Triangle\nusing Path: ")
                Path{ path in
                    path.move(to: CGPoint(x: 50, y: 50))
                    path.addLine(to: CGPoint(x: 100, y: 100))
                    path.addLine(to: CGPoint(x: 0, y: 100))
                    path.addLine(to: CGPoint(x: 50, y: 50))
                }.frame(width:100, height: 100)
                    .foregroundColor(.red)
            }
            

        }
    }
}
//MARK: -FullScreenSheet
struct fullScreenSheetExample: View{
    @State var isPresented = false
    @State public var code = #"""
struct fullScreenSheetExample: View{
    @State var isPresented = false
    var body: some View{
        VStack {
            Button{
                isPresented.toggle()
            }label:{
                Text("Tap/Click to toggle sheet")
            }
        }.fullScreenCover(isPresented: $isPresented, content: fullScreenSheetView.init)
    }
}

struct fullScreenSheetView: View{
    @Environment(\.dismiss) var dismiss
    var body: some View{
        VStack{
            Text("Hello World!")
            Button{
                dismiss()
            }label:{
                Text("Dismiss Sheet")
            }
        }.padding()
    }
}
"""#
    var body: some View{
        VStack {
            Button{
                isPresented.toggle()
            }label:{
                Text("Tap/Click to toggle sheet")
            }
        }.fullScreenCover(isPresented: $isPresented, content: fullScreenSheetView.init)
    }
}

struct fullScreenSheetView: View{
    @Environment(\.dismiss) var dismiss
    var body: some View{
        VStack{
            Text("Hello World!")
            Button{
                dismiss()
            }label:{
                Text("Dismiss Sheet")
            }
        }.padding()
    }
}

//MARK: -Navigation Link
struct navigationLinkView: View{
    @State public var code = #"""
struct navigationLinkView: View{
    var body: some View{
        NavigationView{
            VStack{
                NavigationLink("Link as Text", destination: destinationExample())
                        .padding()
                NavigationLink("\(Image(systemName: "link")) Link with Image", destination: destinationExample())
            }
        }.border(.pink)
    }
}
struct destinationExample: View{
    var body: some View{
        Text("Hello World!")
    }
}
"""#
    var body: some View{
        NavigationView{
            VStack{
                NavigationLink("Link as Text", destination: destinationExample())
                        .padding()
                NavigationLink("\(Image(systemName: "link")) Link with Image", destination: destinationExample())
            }
        }.border(.pink)
    }
}
struct destinationExample: View{
    var body: some View{
        Text("Hello World!")
    }
}
//MARK: -Ternary Operators
struct ternaryOperatorExample: View{
    @State private var toggle = false
    @State public var code = #"""
struct ternaryOperatorExample: View{
    @State private var toggle = false
    var body: some View{
        VStack{
            Toggle("Toggle Value", isOn: $toggle)
            
            Text((toggle == true) ? "is on" : "is not on")
                .foregroundColor((toggle == true) ? .green : .red)
        }.padding()
    }
}
"""#
    var body: some View{
        VStack{
            Toggle("Toggle Value", isOn: $toggle)
            
            Text((toggle == true) ? "is on" : "is not on")
                .foregroundColor((toggle == true) ? .green : .red)
        }.padding()
    }
}
//MARK: -External Link
struct linkExample: View{
    @State public var code = #"""
struct linkExample: View{
    var body: some View{
        VStack {
            Link("Link to Apple's Website", destination: URL(string: "https://www.apple.com")!)
            Spacer(minLength: 30)
            Link(destination: URL(string: "https://www.apple.com")!){
                Text("\(Image(systemName: "link"))Custom Label For Link\nTo Apple's Website")
            }
        }.padding()
        
    }
}
"""#
    var body: some View{
        VStack {
            Link("Link to Apple's Website", destination: URL(string: "https://www.apple.com")!)
            Spacer(minLength: 30)
            Link(destination: URL(string: "https://www.apple.com")!){
                Text("\(Image(systemName: "link"))Custom Label For Link\nTo Apple's Website")
            }
        }.padding()
        
    }
}

//MARK: -ForEach
struct forEachExample: View{
    //grabing our array of data
    @State var displayedData = dataExample()
    @State public var code = #"""
struct forEachExample: View{
    //grabing our array of data
    @State var displayedData = dataExample()
    
    var body: some View{
        VStack{
            ForEach(displayedData.exampleData){ data in
                Text("Name: \(data.name)")
                Text("Age: \(data.age)")
                Text("Nicknane: \(data.nickname)")
                
                Text("\n\(data.name) is \(data.age) years old and their nickname is \(data.nickname)")
                Spacer(minLength: 5)
            }
        }
    }
}

//example parameter to declare our array of data
struct exampleParamaterArray: Identifiable{
    var id = UUID() //required when using the Identifiable parameter
    var name: String
    var age: Int
    var nickname: String
}

class dataExample{
    //declaring our array of data to be used in our ForEach loop
    @Published var exampleData:[exampleParamaterArray] = [
        
    exampleParamaterArray(name: "jimmy", age: 10, nickname: "jim"),
    exampleParamaterArray(name: "sarah", age: 8, nickname: "bubbles"),
    exampleParamaterArray(name: "isabella", age: 5, nickname: "bella"),
    exampleParamaterArray(name: "daniel", age: 14, nickname: "danny")
    
    ]
}
"""#
    
    var body: some View{
        VStack{
            ForEach(displayedData.exampleData){ data in
                Text("Name: \(data.name)")
                Text("Age: \(data.age)")
                Text("Nicknane: \(data.nickname)")
                
                Text("\n\(data.name) is \(data.age) years old and their nickname is \(data.nickname)")
                Spacer(minLength: 60)
            }
        }
    }
}

//example parameter to declare our array of data
struct exampleParamaterArray: Identifiable{
    var id = UUID() //required when using the Identifiable parameter
    var name: String
    var age: Int
    var nickname: String
}

class dataExample{
    //declaring our array of data to be used in our ForEach loop
    @Published var exampleData:[exampleParamaterArray] = [
        
    exampleParamaterArray(name: "jimmy", age: 10, nickname: "jim"),
    exampleParamaterArray(name: "sarah", age: 8, nickname: "bubbles"),
    exampleParamaterArray(name: "isabella", age: 5, nickname: "bella"),
    exampleParamaterArray(name: "daniel", age: 14, nickname: "danny")
    
    ]
}

//MARK: -Disclosure Groups

struct disclosureGroupExample: View{
    @State var isExpanded = false
    @State var isDoubleExpanded = false
    @State public var code = #"""
struct disclosureGroupExample: View{
    @State var isExpanded = false
    @State var isDoubleExpanded = false
    
    var body: some View{
        VStack {
            DisclosureGroup("Click/Tap to Show", isExpanded: $isExpanded){
                Text("This is an example of a Disclosure Group")
                
                DisclosureGroup("Click/Tap me", isExpanded: $isDoubleExpanded){
                    Text("Embeded Disclosure Group")
                }
            }
        }
    }
}
"""#
    var body: some View{
        VStack {
            DisclosureGroup("Click/Tap to Show", isExpanded: $isExpanded){
                Text("This is an example of a Disclosure Group")
                
                DisclosureGroup("Click/Tap me", isExpanded: $isDoubleExpanded){
                    Text("Embeded Disclosure Group")
                }
            }
        }.padding()
    }
}

//MARK: -Confirmation Dialogue

struct confirmationDialogue: View{
    @State private var isPresented = false
    @State private var confirmation = ""
    @State public var code = #"""
struct confirmationDialogue: View{
    @State private var isPresented = false
    @State private var confirmation = ""
    
    var body: some View{
        VStack{
            Button{
                isPresented.toggle()
            }label:{
                Text("Click / Tap me")
            }
            Text("Confirmation status: \(confirmation)")
                .padding()
                
            
            
        }.confirmationDialog("Confirmation", isPresented: $isPresented){
            Button("Confirm") { confirmation = "Confirmed" }
            Button("Deny", role: .destructive){ confirmation = "Denied" }
            Button("Cancel", role: .cancel) { confirmation = "Cancelled" }
        }message:{
            Text("Confirm or Deny")
        }
    }
}
"""#
    
    var body: some View{
        VStack{
            Button{
                isPresented.toggle()
            }label:{
                Text("Click / Tap me")
            }
            Text("Confirmation status: \(confirmation)")
                .padding()
                
            
            
        }.confirmationDialog("Confirmation", isPresented: $isPresented){
            Button("Confirm") { confirmation = "Confirmed" }
            Button("Deny", role: .destructive){ confirmation = "Denied" }
            Button("Cancel", role: .cancel) { confirmation = "Cancelled" }
        }message:{
            Text("Confirm or Deny")
        }
    }
}
//MARK: - Detect Dark/Light Mode
struct darkLightModeExamlple: View{
    @Environment(\.colorScheme) var colorScheme
    public var code = #"""
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
"""#
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

struct shareLinkExample: View{
    let link = URL(string: "https://www.apple.com")!
    public var code = #"""
struct shareLinkExample: View{
    let link = URL(string: "https://www.apple.com")!
    
    var body: some View{
        VStack{
            ShareLink("Apple's Website", item: link)
            
            Spacer()
            
            ShareLink(item: link){
                Text("\(Image(systemName: "link.circle")) - Share Apple's Website!")
                    .foregroundColor(.green)
            }
        }
    }
}
"""#
    
    var body: some View{
        VStack{
            ShareLink("Apple's Website", item: link)
            
            Spacer()
            
            ShareLink(item: link){
                Text("\(Image(systemName: "link.circle")) - Share Apple's Website!")
                    .foregroundColor(.green)
            }
        }
    }
}



struct exampleViews_Previews: PreviewProvider {
    static var previews: some View {
       shareLinkExample()
    }
}
