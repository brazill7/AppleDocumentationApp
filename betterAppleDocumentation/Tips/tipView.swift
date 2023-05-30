//
//  tipView.swift
//  betterAppleDocumentation
//
//  Created by Maverick Brazill on 5/30/23.
//

import SwiftUI

struct tipView: View {
    @StateObject var appPurchase = StoreKitManager()

    var body: some View {
        ScrollView{
            Text("Tips are never expected but always appriciated")
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
                .padding(.bottom, 30)
            ForEach(appPurchase.storeProducts) {product in
                Button{
                    Task { try await appPurchase.purchase(product) }
                }label:{
                    VStack{
                        Text(product.displayName)
                            .foregroundColor(Color.appColorWhite)
                        
                        if product.displayName == "Coffee Sized Tip"{
                            Text("☕️")
                                .font(.system(size: 100))
                        }else if product.displayName == "Small Tip"{
                            Text("🍎")
                                .font(.system(size: 100))
                        }else if product.displayName == "Large Tip"{
                            Text("🍲")
                                .font(.system(size: 100))
                        }
                        
                        Text(product.displayPrice)
                            .foregroundColor(Color.appColorWhite)
                    }.frame(width: 180)
    
                }.background{
                    RoundedRectangle(cornerRadius: 15)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15))
                        .padding(.all, -8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.appColorBlack, lineWidth: 2)
                                .padding(.all, -8)
                            )
                }.padding(.all, 8)
                .padding(.bottom, 20)
            }
        }
    }
}

struct Tip_Previews: PreviewProvider {
    static var previews: some View {
        tipView()
    }
}
