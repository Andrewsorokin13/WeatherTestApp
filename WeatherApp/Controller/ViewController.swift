//
//  ViewController.swift
//  WeatherApp
//
//  Created by Андрей Сорокин on 31.01.2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    //private let  viewModel = WeatherViewModel()
    
    @IBOutlet weak var searchCityTextField: UITextField!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var tempLable: UILabel!
    @IBOutlet weak var nameCityLable: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    
    private var weatherManager = NetworkManager()
    private let locationManager = CLLocationManager()
    private let datetime = Date()
    let ateFormatter = DateFormatter()
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        ateFormatter.dateFormat = "d MMM, YY"
     
        self.timeLable.text = ateFormatter.string(from: datetime)
        
    }
    

    @IBAction func searchWeatherCityButton(_ sender: UIButton) {
        searchCityTextField.endEditing(true)
    }
    
    @IBAction func locationButton(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    private func update(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        weatherManager.delegate = self
        searchCityTextField.delegate = self
    }
//    private func dateToString() -> String{
//       return ateFormatter.string(from: date)
//        print
//    }
    
}

//MARK: - WeatherManagerDelegate
extension ViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: NetworkManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.tempLable.text = weather.tempString
            self.nameCityLable.text = weather.nameCity
            self.weatherImageView.image = UIImage(named: "\(weather.nameCoordeinate)")
          
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}


//MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchCityTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchCityTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        searchCityTextField.text = ""
        
    }
    
}
//MARK: - CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let locaion = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = locaion.coordinate.latitude
            let lon = locaion .coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

