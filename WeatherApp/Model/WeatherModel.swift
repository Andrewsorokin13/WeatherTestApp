//
//  Location.swift
//  WeatherApp
//
//  Created by Андрей Сорокин on 31.01.2022.
//

import Foundation

struct WeatherModel {
    
    let coordinateId: Int
    let nameCity: String
    let temperature: Double
    
    var nameCoordeinate: String {
        switch coordinateId {
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
        return String(format: "%.0f", temperature - 273.15)
    }
    
    
}
