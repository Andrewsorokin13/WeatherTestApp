//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Андрей Сорокин on 31.01.2022.
//

import Foundation

// MARK: Weather ViewModel Protocol
protocol WeatherViewModelProtocol{
    var nameCity: String { get }
    var temperature: Double { get }
    var nameCoordeinate: String { get   }
    var tempString: String { get }
    var date: String { get }
    func searchWeatherToCity(text: String)
        
}

class WeatherViewModel: WeatherViewModelProtocol{
    
    
    // MARK: Private property
    private var name : String = ""
    private var coordinate : Int = 0
    private var temp : Double = 0.0
    private var nameCoordeinateId : Int = 0
    private var datafetcherManager = DataFetcherManager()
    

    // MARK: Property
    var nameCity: String {
        return self.name
    }
    
    var date: String {
        Date.now.formatted(date: .long, time: .omitted)
    }
    var temperature: Double {
        return temp
    }
    var nameCoordeinate: String {
        switch nameCoordeinateId {
        case 200...232:
            return "cloud"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    var tempString: String {
        if temperature - 273 == -0 {
            return "0"
        }
        return String(format: "%.0f", temperature - 273 )
    }
    
    // MARK: Func search Weather
    func searchWeatherToCity(text: String) {
        datafetcherManager.fetchNewCity(urlFull: text) { weatherData in
            if let weatherData = weatherData {
                self.name = weatherData.name
                self.temp = weatherData.main.temp
                self.nameCoordeinateId = weatherData.weather[0].id
                print(self.name)
            }
        }
    }
}

