//
//  testView.swift
//  betterAppleDocumentation
//
//  Created by Maverick Brazill on 3/17/23.
//

import SwiftUI

struct listView: View{
    @State private var isShowingCode = false
    @State private var isShowingImage = false
    @State private var baseHeight: CGFloat = 0
    @State var targetHeight: CGFloat
    @State var imageHeight: CGFloat

    var description: String
    var example: any View
    var image: String
    var name: String
    var color: Color
    var override: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
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
                                    if isShowingImage{
                                        ScrollViewReader { proxy in
                                            ScrollView([.vertical, .horizontal], showsIndicators: false) {
                                                HStack {
                                                    Image(image)
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: geo.size.width + 200, height: self.isShowingImage ? imageHeight : 0)
                                                        .deferredRendering(for: 0.5)
                                                        .foregroundColor(.gray)
                                                        .id(1)
                                                    
                                                }.onAppear{
                                                    if override{
                                                        proxy.scrollTo(1, anchor: .topLeading)
                                                    }
                                                }
                                                    
                                            }.scrollDisabled(!override)
                                        }
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
                    }
                }
        }
            
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

