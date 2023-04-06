//
//  SwiftUIButton.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 06/01/23.
//

import SwiftUI

struct SwiftUIButton: View {
    var body: some View {
        
        /* simple button
         Button(action: {
         // What to perform
         print("Hello world tapped!")
         }) {
         // How the button looks like
         Text("Hit me!")
         //                .background(Color.purple)
         .fontWeight(.bold)
         .padding()
         .background(Color.purple)
         .cornerRadius(40)
         .foregroundColor(.white)
         .font(.title)
         .padding(10)
         .overlay(
         RoundedRectangle(cornerRadius: 40)
         .stroke(Color.purple, lineWidth: 5)
         )
         }
         
         Button(action: {
         // What to perform
         print("Delete button tapped!")
         }) {
         HStack {
         Image(systemName: "trash")
         .font(.largeTitle)
         
         Text("Delete")
         .font(.largeTitle)
         }
         .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
         .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))   .foregroundColor(.white)
         .cornerRadius(40)
         .padding()
         }
         */
        
        VStack {
            Button(action: {
                // What to perform
                print("Delete tapped!")
            }) {
                // How the button looks like
                HStack {
                    Image(systemName: "trash")
                        .font(.title)
                    Text("Delete")
                        .fontWeight(.semibold)
                        .font(.title)
                }
            }
            .buttonStyle(GradientBackgroundStyle())
            
            Spacer()
            
            Button(action: {
                // What to perform
                print("Add tapped!")
            }) {
                // How the button looks like
                HStack {
                    Image(systemName: "plus")
                        .font(.title)
                }
            }
            .buttonStyle(CircularButton())
        }
    }
}

struct GradientBackgroundStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
            .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .leading, endPoint: .trailing))   .foregroundColor(.white)
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct CircularButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .padding()
            .background(.purple)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotationEffect(configuration.isPressed ? Angle(degrees: 130)  : Angle(degrees: 0))
    }
}

struct SwiftUIButton_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIButton()
    }
}
