//
//  Location.swift
//  WeatherApp
//
//  Created by Андрей Сорокин on 09.02.2022.
//
//
import Foundation
import CoreLocation

class Location:  {
   private let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    //var current: CurrentWeather?
    //MARK: -

//        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//            if let locaion = locations.last {
//                locationManager.stopUpdatingLocation()
//                let lat = locaion.coordinate.latitude
//                let lon = locaion .coordinate.longitude
//                weatherManager.fetchWeather(latitude: lat, longitude: lon)
//            }
//        }
    func setupLocation(){
        locationManager.delegate
        
    }

        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print(error)
        }


}
//class ViewController: UIViewController {
//
//
//    // MARK: Outlets
//    @IBOutlet weak var searchCityTextField: UITextField!
//    @IBOutlet weak var weatherImageView: UIImageView!
//    @IBOutlet weak var tempLable: UILabel!
//    @IBOutlet weak var nameCityLable: UILabel!
//    @IBOutlet weak var timeLable: UILabel!
//
//    // MARK: Private properties
//    private var weatherManager = NetworkManager()
//    private let locationManager = CLLocationManager()
//
//
//    private let datetime = Date()
//    let dateFormatter = DateFormatter()
//
//
//    // MARK: Overriden func
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        update()
//        dateFormatter.dateFormat = "d MMM, YY"
//
//        self.timeLable.text = dateFormatter.string(from: datetime)
//
//    }
//
//
//    // MARK: Action funcs
//    @IBAction func searchWeatherCityButton(_ sender: UIButton) {
//        searchCityTextField.endEditing(true)
//    }
//
//    @IBAction func locationButton(_ sender: UIButton) {
//        locationManager.requestLocation()
//    }
//
//
//    // MARK: Private func
//    private func update(){
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.requestLocation()
//
//        weatherManager.delegate = self
//        searchCityTextField.delegate = self
//    }
//
//}
//
//
////MARK: - WeatherManagerDelegate
//extension ViewController: WeatherManagerDelegate {
//    func didUpdateWeather(_ weatherManager: NetworkManager, weather: WeatherModel) {
//        DispatchQueue.main.async {
//            self.tempLable.text = weather.tempString
//            self.nameCityLable.text = weather.nameCity
//            self.weatherImageView.image = UIImage(named: "\(weather.nameCoordeinate)")
//
//        }
//    }
//
//    func didFailWithError(error: Error) {
//        print(error)
//    }
//}
