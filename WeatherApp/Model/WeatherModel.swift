//
//  WheatherData.swift
//  WeatherApp
//
//  Created by Андрей Сорокин on 01.02.2022.
//

import Foundation
// MARK: WeatherModel
struct WeatherModel: Decodable  {
    let name: String
    let main: Main
    let weather: [Weather]
}

// MARK: Main
struct Main: Decodable {
    var temp: Double
}

// MARK: Weather
struct Weather: Codable {
        let description: String
        let id: Int
}


