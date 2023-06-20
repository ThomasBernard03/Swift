//
//  WeatherManager.swift
//  Clima
//
//  Created by Thomas Bernard on 18/06/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation



struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=7747939537e71b7ffb820e380af6008b&units=metrics"
    
    
    func fetchWeather(cityName : String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
    }
    
    
    private func performRequest(urlString : String){
                
        if let url = URL(string: urlString) {
            
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                
                if error != nil {
                    return
                }
                
                if(data != nil){
                    self.parseJSON(weatherData: data!)
                }
            }
            
            task.resume() // Start the task
        }
    }
    
    private func parseJSON(weatherData : Data){
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
        }
        catch {
            print(error)
        }
        
        
    }
}
