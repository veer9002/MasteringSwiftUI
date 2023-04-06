//
//  ContentView.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 30/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma—which is living with the results of other people’s thinking. Don ’t let the noise of others’ opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.")
            .fontWeight(.bold)
//            .font(.system(.title, design: .rounded))
            .font(.system(size: 20))
            .foregroundColor(.purple)
            .padding()
            .multilineTextAlignment(.center)
            .truncationMode(.tail)
            .lineSpacing(10)
            .padding()
//            .rotationEffect(.degrees(20), anchor: UnitPoint(x: 0, y: 0))
            .rotation3DEffect(.degrees(55), axis: (x: 1, y: 0, z: 0))
            .shadow(color: .gray, radius: 2, x: 20, y: 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
