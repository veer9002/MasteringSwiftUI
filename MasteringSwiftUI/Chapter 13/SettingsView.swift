//
//  SettingsView.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 21/04/23.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var selectedOrder = DisplayOrderType.alphabetical
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var settingStore: SettingStore

    var body: some View {

        NavigationView {
            Form {
                Section(header: Text("SORT PREFERENCE")) {
                    Picker(selection: $selectedOrder, label: Text("Display order")) {
                        ForEach(DisplayOrderType.allCases, id: \.self) { orderType in
                            let _ = print(orderType.text)
                            Text(orderType.text)
                        }
                    }
                }
                
                Section(header: Text("FILTER PREFERENCE")) {
                    Toggle(isOn: $showCheckInOnly) {
                        Text("Filters")
                    }
                }
                
                Stepper {
                    Text("Show \(String(repeating: "$", count: maxPriceLevel)) or below")
                } onIncrement: {
                    self.maxPriceLevel += 1
                    if self.maxPriceLevel > 5 {
                        self.maxPriceLevel = 5
                    }
                } onDecrement: {
                    self.maxPriceLevel -= 1
                    if self.maxPriceLevel < 1 {
                        self.maxPriceLevel = 1
                    }
                }

            }
            
            .navigationBarTitle("Settings")
            
            .navigationBarItems(leading: Button {
                //action
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                //look and feel
                Text("Cancel")
            }, trailing: Button {
                //action
                self.settingStore.showCheckinOnly = self.showCheckInOnly
                self.settingStore.displayOrder = self.selectedOrder
                self.settingStore.maxPriceLevel = self.maxPriceLevel
                self.presentationMode.wrappedValue.dismiss()

            } label: {
                //look and feel
                Text("Save")
            })
        }
        .onAppear(perform: {
            self.selectedOrder = self.settingStore.displayOrder
            self.showCheckInOnly = self.settingStore.showCheckinOnly
            self.maxPriceLevel = self.settingStore.maxPriceLevel
        })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(SettingStore())
    }
}



