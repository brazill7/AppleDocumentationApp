//
//  testView.swift
//  betterAppleDocumentation
//
//  Created by Maverick on 3/17/23.
//

import SwiftUI

struct listView: View{
    @State private var isShowingCode = false
    @State private var isShowingImage = false
    @State private var refreshingView = false
    
    @State private var baseHeight: CGFloat = 0
    @State var refreshCount = 0
    @State var targetHeight = CGFloat(370)
    @State var resetPos = false
    @State var showingSheet = false
    
    var description: String
    var example: any View
    var image: String
    var name: String
    var color: Color
    var override: Bool
    
    @State var scale: Double
    @State var originalScale: Double
    @State var lastScale = 1.0
    var magnification: some Gesture{
        MagnificationGesture()
            .onChanged{ state in
                let delta = state / lastScale
                scale *= delta
                lastScale = state
            }
            .onEnded{ state in
                lastScale = 1.0
            }
    }
    
    func void(){
        
    }
    

    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack{
                    Text(name)
                        .foregroundColor(color)
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                    Spacer()
                    
                    Button{
                        withAnimation {
                            self.isShowingCode.toggle()
                        }
                        
                    }label:{
                        Text("Example\nCode {}")
                            .font(.system(size: 25))
                    }
                }.padding()
        
                ScrollView{
                    ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                
                                .fill(self.isShowingCode ? color : .appColorBlack)
                                .frame(width: geo.size.width - 20, height: self.isShowingCode ? targetHeight : 1)
                            RoundedRectangle(cornerRadius: 10)
                                
                                .stroke(Color.appColorBlack, lineWidth: 5)
                                .frame(width: geo.size.width - 20, height: self.isShowingCode ? targetHeight : 0)
                                //.animation(.linear, value: isShowingCode)
                                .overlay{
                                    if refreshingView{
                                        ProgressView()
                                            .foregroundColor(.appColorBlack)
                                    }
                                    if isShowingImage{
                                        //ScrollViewReader { proxy in
                                        VStack {
                                            ScrollView([.vertical, .horizontal], showsIndicators: false) {
                                                    HStack {
                                                        Image(image)
                                                            .resizable()
                                                            .scaledToFit()
                                                            //.deferredRendering(for: 0.5)
                                                            .foregroundColor(.gray)
                                                            .id(1)
                                                            .scaleEffect(scale)
                                                            .gesture(magnification)
                                                            
                                                        }
                                                    }
                                            Rectangle()
                                                .frame(height: 2)
                                                .padding(EdgeInsets(top: -10, leading: 0, bottom: 0, trailing: 0))
                                            ///Buttons on the bottom of the image
                                            HStack{
                                                Spacer()
                                                Button{
                                                    
                                                }label:{
                                                    Menu("Copy\nCode"){
                                                        Button("Copy Code to Clipboard", action: void)
                                                        Button("Save Image", action: void)
                                                    }
                                                    .foregroundColor(.black)
                                                    .fontWeight(.bold)
                                                }
                                                Spacer()
                                                Button{
                                                    isShowingImage = false
                                                    refreshingView = true
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                                        isShowingImage = true
                                                    }
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                                                        refreshingView = false
                                                    }
                                                }label:{
                                                    Text("Recenter\nImage")
                                                        .foregroundColor(.black)
                                                        .fontWeight(.bold)
                                                }
                                                Spacer()
                                                Button{
                                                    scale = originalScale
                                                }label:{
                                                    Text("Reset\nZoom")
                                                        .foregroundColor(.black)
                                                        .fontWeight(.bold)
                                                }
                                                Spacer()
                                                ///lower scale
                                                Button{
                                                    scale -= 0.1
                                                }label:{
                                                    HStack{
                                                        Image(systemName: "minus.square")
                                                            .font(.system(size: 50))
                                                            .foregroundColor(.black)
                                                    }
                                                }
                                                ///up scale
                                                Button{
                                                    scale += 0.1
                                                }label:{
                                                    HStack{
                                                        Image(systemName: "plus.app")
                                                            .font(.system(size: 50))
                                                            .foregroundColor(.black)
                                                    }
                                                }
                                            }.padding(EdgeInsets(top: -8, leading: 10, bottom: 8, trailing: 10))
                                            
                                        }
                                        .deferredRendering(for: 0.5)
                                    }
                                }
                        }.onChange(of: isShowingCode){ newState in
                            isShowingImage.toggle()
                        }
                        Text(description)
                            .multilineTextAlignment(.center)
                            .padding()
                            .font(.system(size: 20))
                        
                        HStack{
                            Text("Example:")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .padding()
                            Spacer()
                        }
                    AnyView(example)
                        
                }.scrollDisabled(true)
            }
            
//        }.sheet(isPresented: $showingSheet){
//            //AnyView(example)
        }
    }
    }




private struct DeferredViewModifier: ViewModifier {

    // MARK: API

    let threshold: Double

    // MARK: - ViewModifier

    func body(content: Content) -> some View {
        _content(content)
            .onAppear {
               DispatchQueue.main.asyncAfter(deadline: .now() + threshold) {
                   self.shouldRender = true
               }
            }
    }

    // MARK: - Private

    @ViewBuilder
    private func _content(_ content: Content) -> some View {
        if shouldRender {
            content
        } else {
            content
                .hidden()
        }
    }

    @State
    private var shouldRender = false
}

extension View {
    func deferredRendering(for seconds: Double) -> some View {
        modifier(DeferredViewModifier(threshold: seconds))
    }
}

