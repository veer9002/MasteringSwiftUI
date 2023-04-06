//
//  Exercise7.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 11/01/23.
//

import SwiftUI

struct Exercise7: View {
   
    @State private var redCount = 0
    @State private var blueCount = 0
    @State private var greenCount = 0

    var body: some View {
      
        VStack {
            Text("\(redCount + blueCount + greenCount)")
                .font(.system(size: 150, weight: .bold, design: .rounded))
            HStack {
                CounterButton(number: $redCount, color: .red)
                CounterButton(number: $blueCount, color: .blue)
                CounterButton(number: $greenCount, color: .green)
            }
        }
    }
}

struct Exercise7_Previews: PreviewProvider {
    static var previews: some View {
        Exercise7()
    }
}
