//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Андрей Сорокин on 31.01.2022.
//

import Foundation
import CoreLocation

class Location {

}


class NetworkManager {
    static let shared = NetworkManager()
    
 let weatherURL = ("https://api.openweathermap.org/data/2.5/weather?appid=a46c70052dee40386f85b6eccd46d998")
     var delegate : WeatherManagerDelegate?

    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlWear: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlWear: urlString)
    }
    
    func performRequest( urlWear: String){
        if  let url = URL(string: urlWear){
            let session = URLSession(configuration: .default)
            let task =  session.dataTask(with: url) { (data, response, erorr) in
                if erorr != nil {
                    self.delegate?.didFailWithError(error: erorr!)
                          return
                      }
                if let saveData = data {
                    if let weather = self.parseJSON(data: saveData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                      }
            }
            task.resume()
        }
    }
    
    func parseJSON(data: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do {
           let decoderData = try decoder.decode(WeatherData.self, from: data)
            let id = decoderData.weather[0].id
            let temp = decoderData.main.temp
            let name = decoderData.name
            
            let weather = WeatherModel(coordinateId: id, nameCity: name, temperature: temp)
            return weather
            
        }catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
