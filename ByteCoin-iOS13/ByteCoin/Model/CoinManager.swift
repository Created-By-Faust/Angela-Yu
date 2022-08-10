//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdatePrice(price: String, currency: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "AE6A3AA8-0585-4D55-9DB2-ED86E502B2EB"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String) {
        
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    let bitcoinPrice = self.parseJSON(safeData)
                    let priceString = String(format: "%.2f", bitcoinPrice!)
                    
                    self.delegate?.didUpdatePrice(price: priceString, currency: currency)
                }
            }
            task.resume()
        }
    }
        
    func parseJSON(_ data: Data) -> Double? {
        let decocder = JSONDecoder()
        do {
            let decocdedData = try decocder.decode(CoinData.self, from: data)
            let lastPrice = decocdedData.rate
            return lastPrice
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
