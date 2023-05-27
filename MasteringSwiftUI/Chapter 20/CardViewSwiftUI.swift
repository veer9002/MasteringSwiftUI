//
//  CardView.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 27/04/23.
//

import SwiftUI

struct CardViewSwiftUI: View, Identifiable {
   
    let id = UUID()
    let image : String
    let title: String
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .cornerRadius(10)
            .padding()
        
            .overlay(
                VStack {
                    Text(title)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        .background(Color.white)
                        .cornerRadius(5)
                }
                .padding([.bottom], 30)
                
                , alignment: .bottom)
    
    }
}

struct CardViewSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        CardViewSwiftUI(image: "hong-kong", title: "Hong Kong")
    }
}
