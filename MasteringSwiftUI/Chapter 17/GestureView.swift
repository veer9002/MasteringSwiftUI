//
//  GestureView.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 25/04/23.
//

/***
 
 NOTE: - Gesture chapter is skipped
 
 */

import SwiftUI

struct GestureView: View {
    
    @State private var isPressed = false
    @GestureState private var longPressTap = false
    
    var body: some View {
        Image(systemName: "star.circle.fill")
            .foregroundColor(.green)
            .opacity(longPressTap ? 0.4 : 1.0)
            .scaleEffect(isPressed ? 0.5 : 1.0)
            .animation(.easeInOut, value: 2)
            .font(.system(size: 200))
           
            .gesture(
                TapGesture()
                .onEnded({ _ in
                    self.isPressed.toggle()
                })
                )
    }

}

struct GestureView_Previews: PreviewProvider {
    static var previews: some View {
        GestureView()
    }
}
