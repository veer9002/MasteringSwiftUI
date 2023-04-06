//
//  Shape.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 11/01/23.
//

import SwiftUI

struct SwiftUIShape: View {
    
    private var purpleGradient = LinearGradient(gradient: Gradient(colors: [ Color (red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255,blue: 179/255) ]), startPoint: .trailing, endPoint: .leading)
    
    var body: some View {
        /*
        Path() { path in
            path.move(to: CGPoint(x: 20, y: 60))
            path.addLine(to: CGPoint(x: 40, y: 60))
            path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
            path.addLine(to: CGPoint(x: 230, y: 60))
            path.addLine(to: CGPoint(x: 230, y: 100))
            path.addLine(to: CGPoint(x: 20, y: 100))
            path.closeSubpath()
        }
        .stroke(Color.green, lineWidth: 10)
//        .fill(.green)
         */
        
        
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 20)
                .frame(width: 300, height: 300)
            Circle()
                .trim(from: 0, to: 0.85)
                .stroke(purpleGradient, lineWidth: 20)
                .frame(width: 300, height: 300)
                .overlay(
                    
                    VStack {
                        Text("85%")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                            .foregroundColor(Color(.systemGray))
                        Text("Complete")
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundColor(Color(.systemGray))
                    }
                
                )
        }
    }
}

struct SwiftUIShape_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIShape()
    }
}
