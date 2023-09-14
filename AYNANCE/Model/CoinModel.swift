//
//  CoinModel.swift
//  AYNANCE
//
//  Created by İbrahim Ay on 7.08.2023.
//

import Foundation

struct CoinsModel: Codable {
    let symbol: String
    let name: String
    let image: String?
    let currentPrice: Double
    let priceChange: Double
    
    enum CodingKeys: String, CodingKey {
        case symbol
        case name
        case image
        case currentPrice = "current_price"
        case priceChange = "price_change_24h"
    }
}
