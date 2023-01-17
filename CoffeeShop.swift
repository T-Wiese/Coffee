//
//  CoffeeShop.swift
//  Coffee
//
//  Created by Torin Wiese (Work) on 1/16/23.
//

import Foundation

struct CoffeeShop: Identifiable, Decodable, Hashable {
    let id: String
    let name: String
    let imageUrl: String
    let price: String?
    let location: Location

}

struct Location: Decodable, Hashable {
    let address1: String?
    let address2: String?
    let address3: String?
    let city: String?
    let zipCode: String?
    let country: String?
    let state: String?
    let displayAddress: [String]
    let crossStreets: String?
}
