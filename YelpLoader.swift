//
//  YelpLoader.swift
//  Coffee
//
//  Created by Torin Wiese (Work) on 1/15/23.
//

import Foundation
class YelpLoader: ObservableObject {
    //static let shared = YelpLoader()
    let headers = ["Authorization": "Bearer a0fdsDA4oSuLvbm4Q3eJTBVXQfE2vTagdCoCl8-ozHGy3DEaMmkpKccoFdZo5KZJ5_Gnf0xBenDO1dACOOYVPC5-iRgnHjuVbjnrnDTZ1knNBr1Y1L7vDQutCZzEY3Yx", "accept": "Application/json"]
    
    var searchTerm: String = "Coffee"
    var location: String = "410%20Townsend%20Street,%20San%20Francisco,%20CA"
    @Published var shops: [CoffeeShop] = [CoffeeShop(id:"461", name: "HAHA", imageUrl: "454", price: "$", location: Location(address1: "", address2: nil, address3: nil, city: nil, zipCode: nil, country: nil, state: nil, displayAddress: ["461 HAHA St"], crossStreets: nil))]
    
    func loadResults() {
        let urlString = "https://api.yelp.com/v3/businesses/search?term=" + searchTerm + "&location=" + location + "&sort_by=best_match&limit=20"
        let request = NSMutableURLRequest(url: NSURL(string: urlString )! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { [self] (data, response, error) -> Void in
          if (error != nil) {
            print(error as Any)
          } else {
              //let httpResponse = response as? HTTPURLResponse
              //print(httpResponse)
              guard let data = data else {
                  return
              }
              //print(data)
              DispatchQueue.main.async {
                  self.shops = self.parseResults(data)
                  print(self.shops)
              }

          }
        })

        dataTask.resume()
        //closure(self.shops)
    }
    
    func parseResults(_ data: Data) -> [CoffeeShop] {
        let decoder = JSONDecoder()
        do {
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let results = try decoder.decode(YelpResponse.self, from: data)
            //print(results)
            return results.businesses
        } catch {
            print(error)
        }
        return []
    }
}

struct YelpResponse: Decodable {
    let businesses: [CoffeeShop]
    let total: Int
}
