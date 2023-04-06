//
//  NavigationView.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 04/03/23.
//

import SwiftUI

struct SwiftUINavigationView: View {
    
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
        NavigationView {
            List {
                ForEach(restaurants) { restaurant in
                    NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                        BasicImageRow(restaurant: restaurant)
                    }
                }
            }
            .navigationBarTitle("Restaurants", displayMode: .inline)
//            .navigationTitle("Restaurants")
        }
    }
    
}

struct SwiftUINavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUINavigationView()
    }
}
