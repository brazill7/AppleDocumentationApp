//
//  testView.swift
//  betterAppleDocumentation
//
//  Created by Maverick on 3/17/23.
//

import SwiftUI
import UIKit

struct listView: View{
    @Environment(\.dismiss) var dismiss: DismissAction
    
    
    @State private var columnVisibility = NavigationSplitViewVisibility.automatic
    @State var localData = appStorage()
    @State private var isShowingCode = false
    @State private var isShowingImage = false
    @State private var refreshingView = false
    
    @State private var baseHeight: CGFloat = 0
    @State var refreshCount = 0
    @State var targetHeight = CGFloat(370)
    @State var resetPos = false
    @State var showingSheet = false
    @State var copiedCode = false
    
    var description: String
    var example: any View
    var image: String
    var name: String
    var color: Color
    var codeText: String
    
    let pasteboard = UIPasteboard.general
    
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
            VStack(alignment: .leading) {
                //Checking for the users device
                if UIDevice.current.userInterfaceIdiom == .phone{
                    Button{
                        dismiss()
                    }label:{
                        Text("\(Image(systemName: "arrow.left")) Back")
                    }.padding()
                }
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
                            Text("Code {}")
                                .font(.system(size: 25))
                        }
                    }.padding()
            
                    ScrollView{
                        ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    
                                    .fill(self.isShowingCode ?
                                          color :
                                         .appColorBlack)
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
                                                                //.foregroundColor(.gray)
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
                                                        Button("Copy Code"){
                                                            pasteboard.string = codeText
                                                            copiedCode = true
                                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                                                copiedCode = false
                                                            }
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
                                                                .opacity((scale > 0.11) ? 1.0 : 0.2)
                                                        }
                                                    }.disabled((scale > 0.11) ? false : true)
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
                                        
                                        //shows up when code is copied
                                        if copiedCode{
                                            Text("Successfully Copied Code to Clipboard")
                                                .background{
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .foregroundColor(.gray)
                                                        .padding(EdgeInsets(top: -10, leading: -10, bottom: -10, trailing: -10))
                                                }
                                        }
                                    }
                            }.onChange(of: isShowingCode){ newState in
                                isShowingImage.toggle()
                            }
                        if (localData.description == true){
                            Text(description)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                .font(.system(size: 20))
                        }
                            HStack{
                                Text("Example:")
                                    .font(.system(size: 30))
                                    .fontWeight(.bold)
                                    .padding()
                                Spacer()
                            }
                        AnyView(example)
                            
                    }.scrollIndicators(.hidden)
                        .toolbar({
                            #if os(iOS)
                            .hidden
                            #else
                            .visible
                            #endif
                        }())
                }
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

