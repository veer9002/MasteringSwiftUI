//
//  ScrollView.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 04/01/23.
//

import SwiftUI

struct ScrollViewChapter5: View {
    
    var body: some View {

        // title
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("MONDAY, AUGUST 20")
                    .padding(.leading)
                    .font(.subheadline)
                    .foregroundColor(.gray)
               
                Text("Your Reading")
                    .padding(.leading)
                    .font(.system(size: 35, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
            }
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Group {
                        CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "WRITTEN BY APPLE")
                        CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "WRITTEN BY APPLE")
                        CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
                        CardView(image: "natural-language-api", category: "iOS", heading: "What's Newin Natural Language API", author: "Sai Kambampati")
                    }
                    .frame(width: 300)
                }
                Spacer()
            }
        }
    }
}

struct ScrollViewChapter5_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewChapter5()
    }
}


struct CardView: View {
    var image: String
    var category: String
    var heading: String
    var author: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(category)
                        .foregroundColor(.gray)
                        .font(.title)
                    .fontWeight(.medium)
                    Text(heading)
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.black)
                        .lineLimit(3)
                        .minimumScaleFactor(0.5)
                    Text(author)
                        .foregroundColor(.gray)
                        .font(.headline)
                        .fontWeight(.medium)
                }
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255,
                opacity: 0.1), lineWidth: 1))
        .padding([.top, .horizontal])
    }
}
