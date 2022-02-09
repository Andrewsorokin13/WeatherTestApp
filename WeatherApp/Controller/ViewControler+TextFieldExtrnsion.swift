//
//  ViewControler+TextFieldExtrnsion.swift
//  WeatherApp
//
//  Created by Андрей Сорокин on 09.02.2022.
//

import UIKit

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
            viewModel.searchWeatherToCity(text: city)
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
        searchCityTextField.text = ""
    }

}
