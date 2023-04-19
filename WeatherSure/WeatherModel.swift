//
//  WeatherModel.swift
//  WeatherSure
//
//  Created by Pooja Panirwala on 2023-04-17.
//

import Foundation
class WeatherModel: Codable {
    let data: Weather?
}
//
//struct _WeatherData: Codable {
//    let timelines: [WeatherTimelines]
//}
//
//struct WeatherTimelines: Codable {
//    let intervals: [WeatherIntervals]
//}
//
//struct WeatherIntervals: Codable {
//    let startTime: String
//    let values: WeatherValue
//}
//
//struct WeatherValue: Codable {
//    var temperature: Double
//    var weatherCode: Int
//}
struct Condition: Codable{
    let text: String?
    let icon: String?
}


struct Location {
    let name: String
}

struct Current :Codable{
    let tempC: Double
    let condition: Condition
}
struct WeatherData {
    let location: Location
    let current: Current
}
struct Weather:Codable {
    let location: String?
    let region: String?
    let country: String?
    let localtime: Date?
    let temp_c: Double?
    let temp_f: Double?
    let wind_mph: Double?
    let wind_kph: Double?
    let wind_degree: Double?
    let humidity: Double?
    let feelslike_c: Double?
    let condition: Condition
    let daily_will_it_rain: Bool?
    let daily_chance_of_rain: Int?
    let daily_will_it_snow: Bool?
    let current: Current
}
struct astro{
    let sunrise: String
    let sunset: String
}
