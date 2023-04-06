//
//  Exercise #2.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 04/01/23.
//

import SwiftUI

struct Exercise__2: View {
    var body: some View {
        
        ZStack {
            PricingView(title: "Team", price: "$299", textColor: .white, bgColor: .black, icon: "wand.and.rays")
                .offset(x: 0, y: 180)
                .padding()
                
            PricingView(title: "Pro", price: "$19", textColor: .white, bgColor: .orange, icon: "triangle.fill")
                .scaleEffect(0.95)
                .padding()
            
            PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple, icon: "person")
                .padding()
                .scaleEffect(0.9)
                .offset(x: 0, y: -180)
        }
        
//        VStack {
//            ZStack {
//                PricingView(title: "Team", price: "$299", textColor: .white, bgColor: .black, icon: "wand.and.rays")
//            }
//            .offset(x: 0, y: 30)
//
//            PricingView(title: "Pro", price: "$19", textColor: .white, bgColor: .orange, icon: "triangle.fill")
//
//            ZStack {
//                PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple, icon: "person")
//            }
//            .offset(x: 0, y: -30)
//        }
//        .padding()
    }
}

struct Exercise__2_Previews: PreviewProvider {
    static var previews: some View {
        Exercise__2()
    }
}
