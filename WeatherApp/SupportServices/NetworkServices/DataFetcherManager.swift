//
//  DataFetcherManager.swift
//  WeatherApp
//
//  Created by Андрей Сорокин on 08.02.2022.
//

import Foundation


class DataFetcherManager {
   
    // MARK: Private property
    private let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=a46c70052dee40386f85b6eccd46d998"
    private var networkDataFetch: NetworkDataFetchProtocol
    // MARK: Init
    init(networkDataFetch: NetworkDataFetchProtocol = NetworkDataFetch() ) {
        self.networkDataFetch = networkDataFetch
    }
    
 
    // MARK: Func
    func fetchNewCity(urlFull: String ,completion: @escaping (WeatherModel?) -> Void) {
        let urlNewCity = "\(weatherURL)&q=\(urlFull)"
        networkDataFetch.fetchGenericJSON(urlString: urlNewCity, response: completion)
        print(urlNewCity)
    }
    
}
