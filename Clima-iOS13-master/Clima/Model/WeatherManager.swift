//
//  WeatherManager.swift
//  Clima
//
//  Created by Thomas Bernard on 18/06/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation


protocol WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager : WeatherManager, weather : WeatherModel)
    func didFailWithError(error : Error)
}


struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=7747939537e71b7ffb820e380af6008b&units=metrics"
    
    var delegate : WeatherManagerDelegate?
    
    
    func fetchWeather(cityName : String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString:urlString)
    }
    
    
    private func performRequest(urlString : String){
                
        if let url = URL(string: urlString) {
            
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                
                if error != nil {
                    
                    self.delegate?.didFailWithError(error: error!)
                    
                    return
                }
                
                if(data != nil){
                    if let weather = self.parseJSON(weatherData: data!) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            task.resume() // Start the task
        }
    }
    
    private func parseJSON(weatherData : Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
        
            
            return weather
        }
        catch {
            print(error)
            self.delegate?.didFailWithError(error: error)
            return nil
        }
        
        
    }
    
    

}
