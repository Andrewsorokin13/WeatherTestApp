//
//  DataFetcherManager.swift
//  WeatherApp
//
//  Created by Андрей Сорокин on 08.02.2022.
//

import Foundation

class DataFetcherManager {
   
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=a46c70052dee40386f85b6eccd46d998"
   
    private var networkDataFetch: NetworkDataFetchProtocol
    
    init(networkDataFetch: NetworkDataFetchProtocol = NetworkDataFetch() ) {
        self.networkDataFetch = networkDataFetch
    }
    
 

    func fetchNewGames(urlFull: String ,completion: @escaping (WeatherData?) -> Void) {
        let urlNewGames = "\(weatherURL)&q=\(urlFull)"
        networkDataFetch.fetchGenericJSON(urlString: urlNewGames, response: completion)
    }
    
}
