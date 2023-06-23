//
//  WeatherData.swift
//  Clima
//
//  Created by Thomas Bernard on 20/06/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData : Codable  {
    let name : String
    let main : Main
    let weather : [Weather]
}

struct Main : Codable {
    let temp : Double
}

struct Weather : Codable {
    let id : Int
}
