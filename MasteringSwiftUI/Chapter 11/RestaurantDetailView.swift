//
//  RestaurantDetailView.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 05/03/23.
//

import SwiftUI

struct RestaurantDetailView: View {
    var restaurant: Restaurant
    
    var body: some View {
        VStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            Spacer()
        }
    }
    
}

//struct RestaurantDetailView_Previews: PreviewProvider {
//    static var previews: some View {
////        RestaurantDetailView()
//    }
//}
