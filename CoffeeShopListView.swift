//
//  CoffeeShopListView.swift
//  Coffee
//
//  Created by Torin Wiese (Work) on 1/16/23.
//

import SwiftUI

struct CoffeeShopListView: View {
    @ObservedObject var loader: YelpLoader
    @State var shops: [CoffeeShop]  = [CoffeeShop(id:"461", name: "HAHA", imageUrl: "454", price: "$", location: Location(address1: "", address2: nil, address3: nil, city: nil, zipCode: nil, country: nil, state: nil, displayAddress: ["461 HAHA St"], crossStreets: nil))]
    var body: some View {
        
        List {
            ForEach(shops, id:\.self) { shop in
                CoffeeShopResultView(coffeeShop: shop)
            }
            
        }.task {
            loader.loadResults()
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                //self.shops = loader.shops
                print(shops)
                print("RESET SHOPS")
            })
        }
        
    }
    
}
/*
struct CoffeeShopListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeShopListView()
    }
}
*/
