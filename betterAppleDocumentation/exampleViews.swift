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
    var body: some View{
        Image("puppy")
            .resizable()
            .scaledToFit()
    }
}


// MARK: Buttons
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
// MARK: Text Fields
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

// MARK: Secure Field
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

// MARK: Menu Example
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
// MARK: List Example
struct listWorkAround: View{
    @State private var exampleArr = ["a", "b", "c", "d", "e"]
    var sheet = listExample()
    
    var body: some View{
        GeometryReader { geo in
            VStack {
                EditButton()
                    .multilineTextAlignment(.center)
                
                List{
                    ForEach(exampleArr, id: \.self){ example in
                        Text(example)
                    }.onDelete(perform: { exampleArr.remove(atOffsets: $0)})
                    .onMove(perform: {exampleArr.move(fromOffsets: $0, toOffset: $1)})
                    .swipeActions(edge: .trailing, allowsFullSwipe: true){
                        Button{
                            //function goes here
                        }label:{
                        Image(systemName: "trash")
                            
                        }
                    }
                }.frame(width: geo.size.width, height: 800)
            }.padding()
        }

    }
}

struct listExample: View{
    @State var test = false
    var body: some View{
        
        GeometryReader { geo in
            VStack {
                Button{
                    test.toggle()
                }label:{
                    Text("Test")
                        .position(x: geo.size.width/2 )
                }
            }.sheet(isPresented: $test){
                listWorkAround()
            }
        }
    }
}


struct exampleViews_Previews: PreviewProvider {
    static var previews: some View {
        listExample()
    }
}
