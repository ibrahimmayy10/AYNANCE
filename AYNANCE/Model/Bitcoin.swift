//
//  Bitcoin.swift
//  AYNANCE
//
//  Created by İbrahim Ay on 11.08.2023.
//

import Foundation

struct Bitcoin: Codable {
    let name: String
    let symbol: String
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
