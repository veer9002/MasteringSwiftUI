//
//  SwiftUIForm.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 19/04/23.
//

import SwiftUI

struct RestaurantForm: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var phone: String
    var image: String
    var priceLevel: Int
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
}

struct SwiftUIForm: View {
    
    @State var restaurants = [
        RestaurantForm(name: "Cafe Deadend", type: "Coffee & Tea Shop", phone: "232-923423", image: "cafedeadend", priceLevel: 3),
        RestaurantForm(name: "Homei", type: "Cafe", phone: "348-233423", image: "homei", priceLevel: 3),
        RestaurantForm(name: "Teakha", type: "Tea House", phone: "354-243523", image: "teakha", priceLevel: 3, isFavorite: true, isCheckIn: true),
        RestaurantForm(name: "Cafe loisl", type: "Austrian / Casual Drink", phone: "453-333423", image: "cafeloisl", priceLevel: 2, isFavorite: true, isCheckIn: true),
        RestaurantForm(name: "Petite Oyster", type: "French", phone: "983-284334", image: "petiteoyster", priceLevel: 5, isCheckIn: true),
        RestaurantForm(name: "For Kee Restaurant", type: "Hong Kong", phone: "232-434222", image: "forkeerestaurant", priceLevel: 2, isFavorite: true, isCheckIn: true),
        RestaurantForm(name: "Po's Atelier", type: "Bakery", phone: "234-834322", image: "posatelier", priceLevel: 4),
        RestaurantForm(name: "Bourke Street Backery", type: "Chocolate", phone: "982-434343", image: "bourkestreetbakery", priceLevel: 4, isCheckIn: true),
        RestaurantForm(name: "Haigh's Chocolate", type: "Cafe", phone: "734-232323", image: "haighschocolate", priceLevel: 3, isFavorite: true),
        RestaurantForm(name: "Palomino Espresso", type: "American / Seafood", phone: "872-734343", image: "palominoespresso", priceLevel: 2),
        RestaurantForm(name: "Upstate", type: "Seafood", phone: "343-233221", image: "upstate", priceLevel: 4),
        RestaurantForm(name: "Traif", type: "American", phone: "985-723623", image: "traif", priceLevel: 5),
        RestaurantForm(name: "Graham Avenue Meats", type: "Breakfast & Brunch", phone: "455-232345", image: "grahamavenuemeats", priceLevel: 3),
        RestaurantForm(name: "Waffle & Wolf", type: "Coffee & Tea", phone: "434-232322", image: "wafflewolf", priceLevel: 3),
        RestaurantForm(name: "Five Leaves", type: "Bistro", phone: "343-234553", image: "fiveleaves", priceLevel: 4, isFavorite: true, isCheckIn: true),
        RestaurantForm(name: "Cafe Lore", type: "Latin American", phone: "342-455433", image: "cafelore", priceLevel: 2, isFavorite: true, isCheckIn: true),
        RestaurantForm(name: "Confessional", type: "Spanish", phone: "643-332323", image: "confessional", priceLevel: 4),
        RestaurantForm(name: "Barrafina", type: "Spanish", phone: "542-343434", image: "barrafina", priceLevel: 2, isCheckIn: true),
        RestaurantForm(name: "Donostia", type: "Spanish", phone: "722-232323", image: "donostia", priceLevel: 1),
        RestaurantForm(name: "Royal Oak", type: "British", phone: "343-988834", image: "royaloak", priceLevel: 2, isFavorite: true),
        RestaurantForm(name: "CASK Pub and Kitchen", type: "Thai", phone: "432-344050", image: "caskpubkitchen", priceLevel: 1)
    ]
    
    @EnvironmentObject var settingStore: SettingStore

    
    @State private var selectedRestaurant:RestaurantForm?
    @State private var showSettings: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(restaurants.sorted(by: self.settingStore.displayOrder.predicate())) { restaurant in
                    if self.shouldShowItem(restaurant: restaurant) {
                        RestuarantListCell(restaurant: restaurant).contextMenu {
                            Button {
                                //action
                                self.checkIn(item: restaurant)
                            } label: {
                                HStack {
                                    Text("Check-in")
                                    Image(systemName: "checkmark.seal.fill")
                                }
                            }
                            
                            
                            Button(action: {
                                // delete the selected restaurant
                                self.delete(item: restaurant)
                            }) {
                                HStack {
                                    Text("Delete")
                                    Image(systemName: "trash")
                                }
                            }
                            
                            Button {
                                //action
                                self.setFavorite(item: restaurant)
                            } label: {
                                //look and feel
                                HStack {
                                    Text("Favorite")
                                    Image(systemName: "star")
                                }
                            }
                        }
                        .onTapGesture {
                            self.selectedRestaurant = restaurant
                        }
                    }

                }
                .onDelete { (indexSet) in
                    self.restaurants.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle(Text("Restaurant"))
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarItems(trailing:
                                    Button {
                self.showSettings = true
            } label: {
                //look and feel
                Image(systemName: "gear").font(.title)
                            .foregroundColor(.black)
            }
            )
            .sheet(isPresented: $showSettings) {
                SettingsView().environmentObject(self.settingStore)
            }
        }
    }
    
    private func delete(item restaurant: RestaurantForm) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants.remove(at: index)
        }
    }
    
    private func setFavorite(item restaurant: RestaurantForm) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants[index].isFavorite.toggle()
        }
    }
    
    private func checkIn(item restaurant: RestaurantForm) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants[index].isCheckIn.toggle()
        }
    }
    
    private func shouldShowItem(restaurant: RestaurantForm) -> Bool {
        return (!self.settingStore.showCheckinOnly || restaurant.isCheckIn) && (restaurant.priceLevel <= self.settingStore.maxPriceLevel)
    }
    
}



struct SwiftUIForm_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIForm().environmentObject(SettingStore())
    }
}


struct RestuarantListCell: View {
    var restaurant: RestaurantForm
    
    var body: some View {
        HStack(spacing: 10) {
            Image(restaurant.image)
                .resizable()
                .frame(width: 80, height: 80, alignment: .leading)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(restaurant.name)
                        .bold()
                    
                    Text(String(repeating: "$", count: restaurant.priceLevel))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                }
                
                Group {
                    Text(restaurant.type)
                    Text(restaurant.phone)
                }
                .font(.subheadline)
                .foregroundColor(.gray)
            }
            
            Spacer()
                .layoutPriority(-100)
            if restaurant.isCheckIn {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.red)
            }
            
            if restaurant.isFavorite {
                //                    Spacer()
                
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}
