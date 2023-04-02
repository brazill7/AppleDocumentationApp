//
//  exampleViews.swift
//  betterAppleDocumentation
//
//  Created by Maverick on 3/20/23.
//

import SwiftUI





// MARK: String Interpolation
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
// MARK: Importing Images
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

// MARK: Alerts
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

// MARK: Buttons
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
// MARK: Color Picker
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
//MARK: Date Picker
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

//MARK: Date Picker (Multiple)
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
// MARK: Geometry Reader
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

// MARK: Text Fields
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

// MARK: Secure Field
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
// MARK: Stepper Example
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
            
            Stepper("Custom Incriment", onIncrement: {num2 += 2}, onDecrement: {num2 -= 2})
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
            
            Stepper("Custom Incriment", onIncrement: {num2 += 2}, onDecrement: {num2 -= 2})
            Text("Current number is \(num2)")
            
        }
    }
}

// MARK: Menu Example
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
// MARK: List Example
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
// MARK: Picker Example

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
// MARK: Tab View

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

//MARK: Text Editor
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

//MARK: Toggle Example

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
//MARK: Slider Example

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


// MARK: Sheets Example

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

// MARK: Raw Strings
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

//MARK: ProgressView
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


struct exampleViews_Previews: PreviewProvider {
    static var previews: some View {
        progressViewExample()
    }
}
