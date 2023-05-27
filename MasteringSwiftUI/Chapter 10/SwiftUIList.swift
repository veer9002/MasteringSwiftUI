//
//  SwiftUIList.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 20/01/23.
//

import SwiftUI

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
}

struct SwiftUIList: View {
    
    var restaurants = [ Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
                        Restaurant(name: "Homei", image: "homei"),
                        Restaurant(name: "Teakha", image: "teakha"),
                        Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
                        Restaurant(name: "Petite Oyster", image: "petiteoyster"),
                        Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
                        Restaurant(name: "Po's Atelier", image: "posatelier"),
                        Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
                        Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"), Restaurant(name: "Palomino Espresso", image: "palominoespresso"), Restaurant(name: "Upstate", image: "upstate"),
                        Restaurant(name: "Traif", image: "traif"),
                        Restaurant(name: "Homei", image: "upstate"),
                        Restaurant(name: "Graham Avenue Meats And Deli", image:"grahamaven"),
                        Restaurant(name: "Waffle & Wolf", image: "wafflewolf"), Restaurant(name: "Five Leaves", image: "fiveleaves"), Restaurant(name: "Cafe Lore", image: "cafelore"), Restaurant(name: "Confessional", image: "confessional"), Restaurant(name: "Barrafina", image: "barrafina"), Restaurant(name: "Donostia", image: "donostia"), Restaurant(name: "Royal Oak", image: "royaloak"), Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    
    var body: some View {
//        List(restaurants.indices) { index in
//            if (0...1).contains(index) {
//                FullImageRow(restaurant: self.restaurants[index])
//            } else {
//                BasicImageRow(restaurant: self.restaurants[index])
//            }
//        }

        List(restaurants) { restaurant in
            ExerciseView(restaurant: restaurant)
        }
    }
}

struct SwiftUIList_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIList()
    }
}

struct BasicImageRow: View {
    var restaurant: Restaurant

    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
                        
            if restaurant.isCheckIn {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.red)
            }
            
            if restaurant.isFavorite {
                Spacer()
                
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
        }
    }
}

struct FullImageRow: View {
    var restaurant: Restaurant

    var body: some View {
        ZStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(20)
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(20)
                        .opacity(0.5)
                )
            HStack {
                Text(restaurant.name)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ExerciseView: View {
    var restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(restaurant.image)
                .resizable()
                .frame(height: 250)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(20)
            Text("Title text dsfads")
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .lineLimit(3)
            Text("author name")
                .font(.system(size: 17, weight: .light))
                .foregroundColor(.gray)
            Image(systemName: "heart")
            Text("Description Text")
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(.gray)
        }
    }
}
