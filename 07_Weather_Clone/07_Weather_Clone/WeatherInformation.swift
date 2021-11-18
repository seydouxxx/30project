//
//  WeatherInformation.swift
//  07_Weather_Clone
//
//  Created by Seydoux on 2021/11/17.
//

import Foundation

struct WeatherInformation: Codable {
    let weather: [Weather]
    let temp: Temp
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case weather
        case temp = "main"
        case name
    }
}

struct Weather: Codable {
    let description: String
}

struct Temp: Codable {
    let temp: Double
}
