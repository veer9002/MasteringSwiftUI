//
//  WalletCardView.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 29/04/23.
//

import SwiftUI

struct WalletCardView: View {
    var card: Card
    
    var body: some View {
        Image(card.image)
            .resizable()
            .scaledToFit()
            .overlay(
            
                VStack(alignment: .leading) {
                    Text(card.number)
                        .bold()
                    HStack {
                        Text(card.name)
                            .bold()
                        Text("Valid thru")
                            .font(.footnote)
                        Text(card.expiryDate)
                            .font(.footnote)
                    }
                }
                    .foregroundColor(.white)
                    .padding(.leading, 25)
                    .padding(.bottom, 20)
                ,alignment: .bottomLeading)
            .shadow(color: .gray, radius: 1.0, x: 0.0, y: 1.0)
    }
}

struct WalletCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(testCards) { card in
                WalletCardView(card: card).previewLayout(.sizeThatFits)
            }
        }
        
    }
}
