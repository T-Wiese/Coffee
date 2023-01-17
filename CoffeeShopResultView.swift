//
//  CoffeeShopResultView.swift
//  Coffee
//
//  Created by Torin Wiese (Work) on 1/16/23.
//

import Foundation
import SwiftUI

struct CoffeeShopResultView: View {
    var coffeeShop: CoffeeShop
    
    var body: some View {
        VStack {
            /*AsyncImage(url: URL(string: coffeeShop.imageUrl)) {image in
                image.resizable()
            } placeholder: {
                Rectangle().frame(width: 50, height: 50)
            }.frame(width: 50, height: 50)*/
            Text("NAME")
            Text(coffeeShop.name)
        }
    }
}
