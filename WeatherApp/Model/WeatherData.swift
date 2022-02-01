//
//  WheatherData.swift
//  WeatherApp
//
//  Created by Андрей Сорокин on 01.02.2022.
//

import Foundation

struct WeatherData: Decodable  {
    let name: String
    let main: Main
    let weather: [Weather]
}
struct Main: Decodable {
    var temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}

