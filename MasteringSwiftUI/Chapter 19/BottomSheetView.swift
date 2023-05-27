//
//  BottomSheetView.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 25/04/23.
//

import SwiftUI

struct BottomSheetView: View {
    
    @State private var showDetails = false
    @State private var selectedRestaurant : RestaurantBS?
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(restaurants) { restaurant in
                        BasicImageRowBS(restaurant: restaurant)
                            .onTapGesture {
                                self.showDetails = true
                                self.selectedRestaurant = restaurant
                            }
                    }
                }
                
                .navigationTitle("Restaurants")
            }
            .offset(y: showDetails ? -100 : 0)
            .animation(.easeOut(duration: 0.2))
        }
        
        if showDetails {
            
            BlankView(bgColor: .black)
                .opacity(0.5)
                .onTapGesture {
                    self.showDetails = false
                }
            
            if let selectedRestaurant = selectedRestaurant {
                RestaurantDetailViewBS(restaurant: selectedRestaurant)
                    .transition(.move(edge: .bottom))
            }
        }

    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView()
    }
}


struct BasicImageRowBS: View {
    var restaurant: RestaurantBS

    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}

struct BlankView : View {
    var bgColor: Color
    var body: some View {
        VStack {
            Spacer()
        }
        
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(bgColor)
            .edgesIgnoringSafeArea(.all)
    }
}
