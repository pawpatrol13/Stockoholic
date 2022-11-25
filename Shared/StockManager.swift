//
//  StockManager.swift
//  Stockoholic
//
//  Created by T Krobot on 24/11/22.
//

import Foundation
class StockManager: ObservableObject {
    @Published var stocks: [Stock] = [] {
        didSet {
            save()
        }
    }
    
    //place stock starting prices and stuff here
    let sampleStocks: [Stock] = [Stock(name: "Dusk Motors", pricePerStockArray: [300], stocksOwned: 0, num: 0),
                                 Stock(name: "Music Max, Inc.", pricePerStockArray: [520], stocksOwned: 0, num: 1),
                                 Stock(name: "FurniWear, Inc.", pricePerStockArray: [220], stocksOwned: 0, num: 2),
                                 Stock(name: "Beats Entertainment LLC", pricePerStockArray: [500], stocksOwned: 0, num: 3),
                                 Stock(name: "Jack's Beef", pricePerStockArray: [450], stocksOwned: 0, num: 4),
                                 Stock(name: "Laurene & Co.", pricePerStockArray: [699], stocksOwned: 0, num: 5),
                                 Stock(name: "Georgian Air", pricePerStockArray: [343], stocksOwned: 0, num: 6),
                                 Stock(name: "Midas, Inc", pricePerStockArray: [420], stocksOwned: 0, num: 7)]
    
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "stocks.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedStocks = try? propertyListEncoder.encode(stocks)
        try? encodedStocks?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalStocks: [Stock]!
        
        if let retrievedStockData = try? Data(contentsOf: archiveURL),
           let decodedStocks = try? propertyListDecoder.decode([Stock].self, from: retrievedStockData) {
            finalStocks = decodedStocks
        } else {
            finalStocks = sampleStocks
        }
        
        stocks = finalStocks
    }
}
