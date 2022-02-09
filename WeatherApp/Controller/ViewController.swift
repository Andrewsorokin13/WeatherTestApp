//
//  ViewController.swift
//  WeatherApp
//
//  Created by Андрей Сорокин on 31.01.2022.
//

import UIKit

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherViewModel)
    func didFailWithError(error: Error)
}

class ViewController: UIViewController {

    
    // MARK: Outlets
    @IBOutlet weak var searchCityTextField: UITextField!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var tempLable: UILabel!
    @IBOutlet weak var nameCityLable: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    
    // MARK: Private properties
     var viewModel = WeatherViewModel()
 
    
    // MARK: Overriden func
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCityTextField.delegate = self
    }
    
    // MARK: Action funcs
    @IBAction func searchWeatherCityButton(_ sender: UIButton) {
        searchCityTextField.endEditing(true)
    }
 
     func updateUI(){
        self.tempLable.text = viewModel.tempString
        self.nameCityLable.text = viewModel.test
        self.weatherImageView.image = UIImage(named: viewModel.nameCoordeinate)
        self.timeLable.text = viewModel.date
    }

}

