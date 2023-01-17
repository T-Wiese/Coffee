//
//  ContentView.swift
//  Coffee
//
//  Created by Torin Wiese (Work) on 1/15/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var loader = YelpLoader()
    //@State var shops: [CoffeeShop] = []
    var body: some View {
        ScrollView {
            CoffeeShopListView(loader: loader, shops:loader.shops)
        }.onAppear{
            loader.loadResults()
        }
    }
}
/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
