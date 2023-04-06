//
//  StateAndBinding.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 09/01/23.
//

import SwiftUI

struct StateAndBinding: View {
    
    @State var isPlaying = false
    @State var number = 0
    
    var body: some View {
        
//        Button(action: {
//            // Switch between the play and stop button
//            self.isPlaying.toggle()
//            number += 1
//        }) {
//            Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill" )
//            .font(.system(size: 150))
//            .foregroundColor(isPlaying ? .red : .green)
//
//            Text("\(number)")
//        }
        
        VStack {
            Text("0")
                .font(.system(size: 150, weight: .bold, design: .rounded))
            HStack {
                CounterButton(number: $number, color: .red)
                CounterButton(number: $number, color: .blue)
                CounterButton(number: $number, color: .green)
            }
        }
        
    }
}

struct CounterButton: View {
    @Binding var number: Int
//    @Binding var redCount: Int?
//    @Binding var blueCount: Int?
//    @Binding var greenCount: Int?

    var color: Color
    
    var body: some View {
        // Exercise
        Button(action: {
            // Switch between the play and stop button
            self.number += 1
        }) {
            Circle()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(color)
                .overlay(
                    Text("\(number)")
                        .font(.system(size: 100, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                )
        }
    }
}

struct StateAndBinding_Previews: PreviewProvider {
    static var previews: some View {
        StateAndBinding()
    }
}
