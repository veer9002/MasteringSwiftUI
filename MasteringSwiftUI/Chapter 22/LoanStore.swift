//
//  LoanStore.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 09/05/23.
//

import Foundation

class LoanStore: Decodable, ObservableObject {
    @Published var loans: [Loan] = []
    private static var kivaLoanURL = "https://api.kivaws.org/v1/loans/newest.json"
    
    enum CodingKeys: CodingKey {
        case loans
    }
    
    required init(from  decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        loans = try values.decode([Loan].self, forKey: .loans)
    }
    
    init() {
        
    }
    
    func fetchLatestLoans() {
        guard let url = URL(string: Self.kivaLoanURL) else {
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in

            if let error = error {
                print(error)
                return
            }

            if let data = data {
                DispatchQueue.main.async {
                    self.loans = self.parseJsonData(data: data)
                }
            }
        }
        
        task.resume()
    }
    
    func parseJsonData(data: Data) -> [Loan] {
        let decoder = JSONDecoder()
        
        do {
            let loanStore = try decoder.decode(LoanStore.self, from: data)
            self.loans = loanStore.loans
        } catch {
            print(error)
        }
        return loans
    }
    
}
