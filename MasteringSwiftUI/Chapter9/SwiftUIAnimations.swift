//
//  SwiftUIAnimations.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 11/01/23.
//

import SwiftUI

struct SwiftUIAnimations: View {
    
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    @State private var isLoading = false
    
    @State private var recordBegin = false
    @State private var recording = false
    
    @State private var show = false
    
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundColor(.green)
                .overlay(
                    Text("Show details")
                        .font(.system(size: 35, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                )
                .onTapGesture {
                    withAnimation(Animation.spring()) {
                        self.show.toggle()
                    }
                }
            
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundColor(.purple)
                    .overlay(
                        Text("Well, here is the details")
                            .font(.system(size: 35, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    )
                    .transition(.scaleAndOffset)
//                    .transition(.scale(scale: 0, anchor: .bottomTrailing))
            }
            
          
        }
        
        /*
        ZStack {
            RoundedRectangle(cornerRadius: recordBegin ? 30 : 5)
                .frame(width: recordBegin ? 60 : 250, height: 60)
                .foregroundColor(recordBegin ? .red : .green)
                .overlay(
                    Image(systemName: "mic.fill")
                        .font(.system(.title, design: .monospaced))
                        .foregroundColor(.white)
                        .scaleEffect(recording ? 0.7 : 1)
                )
            
            RoundedRectangle(cornerRadius: recording ? 35 : 10)
                .trim(from: 0, to: recordBegin ? 0.0001 : 1)
                .stroke(lineWidth: 5)
                .frame(width: recordBegin ? 70 : 260, height: 70)
                .foregroundColor(.green)
        }
        .onTapGesture {
            withAnimation(Animation.spring()) {
                self.recordBegin.toggle()
            }
            withAnimation(Animation.spring().repeatForever().delay(0.5)) {
                self.recording.toggle()
            }
        }
        
        
        VStack {
            ZStack {
                Circle()
                    .stroke(Color(.systemGray), lineWidth: 15)
                    .frame(width: 100, height: 100)
                
                Circle()
                    .trim(from: 0, to: 0.2)
                    .stroke(Color.green, lineWidth: 7)
                    .frame(width: 100, height: 100)
                    .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .onAppear() {
                        self.isLoading = true
                    }
            }
            
            ZStack {
                Text("Loading")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .offset(x: 0, y: 25)
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.systemGray5), lineWidth: 3)
                    .frame(width: 250, height: 3)
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.green, lineWidth: 3)
                    .frame(width: 30, height: 3)
                    .offset(x: isLoading ? 110 : -110, y: 0)
                    .animation(Animation.linear(duration:1).repeatForever(autoreverses: false))
            }
            .onAppear() {
                self.isLoading = true
            }
        }
        
        
        VStack {
            ZStack {
                Circle()
                    .frame(width: 200, height: 200, alignment: .center)
                    .foregroundColor(circleColorChanged ? Color(.systemGray5): .red)
                    .animation(.default)
                
                Image(systemName: "heart.fill")
                    .foregroundColor(heartColorChanged ? .red: .white)
                    .font(.system(size: 100))
                    .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
                    .animation(.default)
            }
            .onTapGesture {
                self.circleColorChanged.toggle()
                self.heartColorChanged.toggle()
                self.heartSizeChanged.toggle()
            }
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(Color.green, lineWidth: 5)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.default.repeatForever(autoreverses: false))
                .onAppear() {
                    self.isLoading = true
                }
        }
        */
        
    }
}

struct SwiftUIAnimations_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAnimations()
    }
}



extension AnyTransition {
    static var offsetScaleOpacity: AnyTransition {
        AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
    }
    
    static var scaleAndOffset: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .scale(scale: 0, anchor: .bottom),
            removal: .offset(x: -600, y: 00)
        )
    }
}
