//
//  HourlyDataModel.swift
//  WeatherSure
//
//  Created by Jagtar Singh matharu on 2023-03-24.
//

import SwiftUI
struct HourlyWeather: Identifiable {
    let id = UUID()
    let time: String
    let iconName: String
    let temperature: Int
    let feelsLikeTemperature: Int
    let windSpeed: Int
    let airQuality: String
    let humidity: Int
}
