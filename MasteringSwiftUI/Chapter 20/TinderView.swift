//
//  TinderView.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 26/04/23.
//

import SwiftUI

struct TinderView: View {
    
    @GestureState private var dragState = DragState.inactive
    @State private var removalTransition = AnyTransition.trailingBottom
    private let dragThreshold: CGFloat = 80.0
    @State private var lastIndex = 1
    
    @State var cardViews: [CardViewSwiftUI] = {
        var views = [CardViewSwiftUI]()
        for index in 0..<2 {
            views.append(CardViewSwiftUI(image: trips[index].image, title: trips[index].destination))
        }
       return views
    }()
    
    var body: some View {
        VStack {
            TopView()
            
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack {
                        Image(systemName: "x.circle")
                        .foregroundColor(.white)
                        .font(.system(size: 100))
                        .opacity(self.dragState.translation.width < -self.dragThreshold && self
                        .isTopCard(cardView: cardView) ? 1.0 : 0)
                        Image(systemName: "heart.circle")
                        .foregroundColor(.white)
                        .font(.system(size: 100))
                        .opacity(self.dragState.translation.width > self.dragThreshold && self
                        .isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            }
                        )
                        .offset(x: self.isTopCard(cardView: cardView) ?  self.dragState.translation.width : 0,
                                y: self.isTopCard(cardView: cardView) ? self.dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.95 : 1.0 )
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double( self.dragState.translation.width / 10) : 0))
                        .animation(.interpolatingSpring(stiffness: 180, damping: 100))
                        .transition(self.removalTransition)
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: { value, state, transaction in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                default:
                                    break
                                }
                            })
                                .onChanged({ (value) in
                                    guard case .second(true, let drag?) = value else {
                                                return
                                    }
                                            if drag.translation.width < -self.dragThreshold {
                                                self.removalTransition = .leadingBottom
                                    }
                                            if drag.translation.width > self.dragThreshold {
                                                self.removalTransition = .trailingBottom
                                    }
                                })
                                .onEnded({ (value) in
                                    guard case .second(true, let drag?) = value else { return }
                                    
                                    if drag.translation.width < -self.dragThreshold ||
                                        drag.translation.width  > self.dragThreshold {
                                        self.moveCard()
                                    }
                                })
                        )
                    
                }
            }
//            CardViewSwiftUI(image: "hong-kong", title: "Hong Kong")
            Spacer(minLength: 20)
            BottomView()
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
        }
        
    }
    
    private func isTopCard(cardView: CardViewSwiftUI) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        return index == 0
    }
    
    private func moveCard() {
        cardViews.removeFirst()
        self.lastIndex += 1
        let trip = trips[lastIndex % trips.count]
        let newCardView = CardViewSwiftUI(image: trip.image, title: trip.destination)
        cardViews.append(newCardView)
    }
}

struct TinderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TinderView()
            TopView().previewLayout(.sizeThatFits)
            BottomView().previewLayout(.sizeThatFits)
        }
    }
}

struct TopView: View {
    var body: some View {
        
        HStack {
            Button {
                //action
                print("Button Tapped")
            } label: {
                //look and feel
                Image(systemName: "line.horizontal.3")
                                .font(.system(size: 30))
                                .foregroundColor(.black)
            }
            Spacer()
            Button {
                //action
                print("Button Tapped")
            } label: {
                //look and feel
                Image(systemName: "mappin.and.ellipse")
                            .font(.system(size: 35))
                            .foregroundColor(.black)
            }
            Spacer()
            Button {
                //action
                print("Button Tapped")
            } label: {
                //look and feel
                Image(systemName: "heart.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
            }
        }
        .padding()
    }
}

struct BottomView: View {
    var body: some View {
        HStack {
            Image(systemName: "xmark")
                .font(.system(size: 30))
                .foregroundColor(.black)
            Button(action: {
                // Book the trip
            }) {
                Text("BOOK IT NOW")
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 35)
                    .padding(.vertical, 15)
                    .background(Color.black)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            Image(systemName: "heart")
                .font(.system(size: 30))
                .foregroundColor(.black)
        }
    }
}



extension AnyTransition {
    static var trailingBottom: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge
                                                                              : .bottom)) )
    }
    static var leadingBottom: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
    } }
