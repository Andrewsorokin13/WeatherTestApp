//
//  Location.swift
//  WeatherApp
//
//  Created by Андрей Сорокин on 09.02.2022.
//
//
//import UIKit
//import CoreLocation
////
//class Location: CLLocationManagerDelegate {}
//   private let locationManager = CLLocationManager()
//    var currentLocation: CLLocation?
//
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if !locations.isEmpty, currentLocation == nil  {
//            currentLocation = locations.first
//            locationManager.stopUpdatingLocation()
//            requestWeatherForLocation()
//        }
//    }
//
//    func requestWeatherForLocation() {
//        guard let currentLocation = currentLocation else {
//            return
//        }
//        let long = currentLocation.coordinate.longitude
//        let lat = currentLocation.coordinate.latitude
//
//        let url = "https://api.darksky.net/forecast/ddcc4ebb2a7c9930b90d9e59bda0ba7a/\(lat),\(long)?exclude=[flags,minutely]"
//
//        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
//
//            // Validation
//            guard let data = data, error == nil else {
//                print("something went wrong")
//                return
//            }
//
//            // Convert data to models/some object
//
//            var json: WeatherResponse?
//            do {
//                json = try JSONDecoder().decode(WeatherResponse.self, from: data)
//            }
//            catch {
//                print("error: \(error)")
//            }
//
//            guard let result = json else {
//                return
//            }
//
//            let entries = result.daily.data
//
//            self.models.append(contentsOf: entries)
//
//            let current = result.currently
//            self.current = current
//
//            self.hourlyModels = result.hourly.data
//
//            // Update user interface
//            DispatchQueue.main.async {
//                self.table.reloadData()
//
//                self.table.tableHeaderView = self.createTableHeader()
//            }
//
//        }).resume()
//    }
//
//
//    func setupLocation() {
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//    }
//
//}
    
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
//    func setupLocation(){
//        locationManager.delegate
//
//    }
//
//        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//            print(error)
//        }



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
