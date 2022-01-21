//
//  CurrencyModel.swift
//  CurrencyConverter
//
//  Created by Alican Kurt on 17.01.2022.
//

import Foundation

struct CurrencyModel: Decodable, Identifiable{
    let id = UUID()
    let currency: String
    let price: String
}
