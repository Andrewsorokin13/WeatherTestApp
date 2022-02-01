//
//  WeatherManagerDelegate.swift
//  WeatherApp
//
//  Created by Андрей Сорокин on 31.01.2022.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: NetworkManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}
