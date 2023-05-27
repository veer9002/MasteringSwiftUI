//
//  SwiftUIKivaLoanApp.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 09/05/23.
//

import SwiftUI

struct SwiftUIKivaLoanApp: View {
    
    @ObservedObject var loanStore = LoanStore()
    
    var body: some View {
        NavigationView {
            List(loanStore.loans) { loan in
                LoanCellView(loan: loan)
                    .padding(.vertical, 5)
            }
            .navigationTitle("Loans")
        }
        .onAppear() {
            self.loanStore.fetchLatestLoans()
        }
    }
}

struct SwiftUIKivaLoanApp_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIKivaLoanApp()
    }
}
