//
//  ImagesAndLabels.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 30/12/22.
//

import SwiftUI

struct ImagesAndLabels: View {
    var body: some View {
        Image("paris")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay(
                Color.black
                    .opacity(0.4)
                    .overlay(
                        Text("Paris")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .frame(width: 200)
                    )
            )
            .overlay(
                Text("If you are lucky enough to have lived in Paris as a young man, then wherever you go for the rest of your life it stays with you, for Paris is a moveab le feast.\n\n- Ernest Hemingway")
                    .fontWeight(.heavy)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .opacity(0.8)
                    .padding(),
                
                alignment: .top
//                Image(systemName: "heart.fill")
//                    .font(.system(size: 50))
//                    .foregroundColor(.black)
//                    .opacity(0.5)
            )
//            .edgesIgnoringSafeArea(.all)
    }
}

struct ImagesAndLabels_Previews: PreviewProvider {
    static var previews: some View {
        ImagesAndLabels()
    }
}
