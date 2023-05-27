//
//  RestaurantDetailView.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 25/04/23.
//

import SwiftUI

struct RestaurantDetailViewBS: View {
    let restaurant: RestaurantBS

    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                HandleBar()
                
                ScrollView(.vertical) {
                    TitleBar()
                    HeaderViewBS(restaurant: self.restaurant)
                    
                    DetailInfoView(info: self.restaurant.location, icon: "map")
                        .padding(.top, 10)
                    DetailInfoView(info: self.restaurant.phone, icon: "phone")
                    DetailInfoView(info: self.restaurant.description, icon: nil)
                            .padding(.top)

                }
                .background(Color.white)
                .cornerRadius(10, antialiased: true)
            }
            .offset(y: geometry.size.height/2)
            .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailViewBS(restaurant: restaurants[0])
            .background(Color.black.opacity(0.3))
            .edgesIgnoringSafeArea(.all)
    }
}

struct HandleBar: View {
        
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 50, height: 5)
                .foregroundColor(Color(.systemGray5))
                .cornerRadius(10)
        }
        
    }
}


struct TitleBar: View {
    var body: some View {
        HStack {
            Text("Restaurant Details")
                .font(.headline)
                .foregroundColor(.primary)
            Spacer()
        }
        .padding()
    }
}

struct HeaderViewBS: View {
    let restaurant: RestaurantBS
    
    var body: some View {
        VStack {
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .clipped()
                .overlay(
                    HStack {
                        VStack(alignment: .leading) {
                            Spacer()
                            Text(restaurant.name)
                                .foregroundColor(.white)
                                .font(.system(.largeTitle, design: .rounded))
                                .bold()
                            Text(restaurant.type)
                                .font(.system(.headline, design: .rounded))
                                .padding(5)
                                .foregroundColor(.white)
                                .background(Color.red)
                                .cornerRadius(5)
                }
                Spacer() }
                .padding() )
        }
    }
}


struct DetailInfoView: View {
    let info: String
    let icon: String?
    
    var body: some View {
        HStack {
            if icon != nil {
                Image(systemName: icon!)
                    .padding(.trailing, 10)
            }
            Text(info)
                .font(.system(.body, design: .rounded))
            Spacer()
        }
        .padding(.horizontal)
       
    }
}


//struct AddressDetails: View {
//    let restaurant: RestaurantBS
//
//    var body: some View {
//        VStack {
//            Text()
//        }
//    }
//}

