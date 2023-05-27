//
//  AppleWallet.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 29/04/23.
//

import SwiftUI

struct AppleWallet: View {
    var cards: [Card] = testCards
    private static let cardOffset: CGFloat = 50.0
    @State var isCardPresented = false
    @State var isCardPressed = false
    @State var selectedCard: Card?
    
    var body: some View {
        VStack {
            TopNavBar()
                .padding(.bottom)
            Spacer()
            
            ZStack {
                if isCardPresented {
                    ForEach(cards) { card in
                        WalletCardView(card: card)
                            .offset(self.offset(for: card))
                            .padding(.horizontal, 35)
                            .zIndex(self.zIndex(for: card))
                            .transition(AnyTransition.slide.combined(with: .move(edge: .leading)).combined(with: .opacity))
                            .animation(self.transitionAnimation(for: card))
                        
                    }
                }
            }
            .onAppear {
                self.isCardPresented.toggle()
            }
            Spacer()
//            WalletCardView(card: card)
        }
        
    }
    
    private func zIndex(for card: Card) -> Double {
        guard let cardIndex = index(for: card) else {
            return 0.0
        }
        return -Double(cardIndex)
    }
    
    private func index(for card: Card) -> Int? {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else {
            return nil
        }
        return index
    }
    
    private func offset(for card: Card) -> CGSize {
        guard let cardIndex = index(for: card) else {
            return CGSize()
        }
        return CGSize(width: 0, height: -50 * CGFloat(cardIndex))
    }
    
    private func transitionAnimation(for card: Card) -> Animation {
        var delay = 0.0
        if let index = index(for: card) {
            delay = Double(cards.count - index) * 0.1
        }
        return Animation.spring(response: 0.1, dampingFraction: 0.8, blendDuration: 0.02).delay(delay)
    }
    
}

struct AppleWallet_Previews: PreviewProvider {
    static var previews: some View {
        AppleWallet()
    }
}


struct TopNavBar : View {
    var body: some View  {
        HStack {
            Text("Wallet")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
            
            Spacer()
            
            Image(systemName: "plus.circle.fill")
                    .font(.system(.title))
        }
        .padding(.horizontal)
        .padding(.top, 20)
    }
}
