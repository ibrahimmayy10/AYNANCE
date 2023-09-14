//
//  Webservices.swift
//  AYNANCE
//
//  Created by İbrahim Ay on 7.08.2023.
//

import Foundation
import UIKit

enum CoinError: Error {
    case serverError
    case parsingError
}

class Webservices {
    
    func downloadCoins(url: URL, completion: @escaping (Result<[CoinsModel], CoinError>) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.serverError))
            } else if let data = data {
                let coinList = try? JSONDecoder().decode([CoinsModel].self, from: data)
                if let coinList = coinList {
                    completion(.success(coinList))
                } else {
                    completion(.failure(.parsingError ))
                }
            }
        }.resume()
    }
    
}
