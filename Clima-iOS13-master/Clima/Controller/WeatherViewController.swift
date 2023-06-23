//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {


    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        weatherManager.delegate = self
        searchTextField.delegate = self
    }
}

// MARK: - UITextFieldDelegate

extension WeatherViewController : UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        //searchTextField.text
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            textField.placeholder = "Type something"
            return false
        }
        else {
            return true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        if(searchTextField.text != ""){
            weatherManager.fetchWeather(cityName: searchTextField.text!)
        }
        
        searchTextField.text = ""
        
    }
}


extension WeatherViewController : WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager : WeatherManager, weather : WeatherModel) {
        print(weather.temperatureString)
        
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(named: weather.conditionName)
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}


