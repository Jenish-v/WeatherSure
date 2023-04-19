//
//  WeatherAPIClient.swift
//  WeatherSure
//
//  Created by Pooja Panirwala on 2023-04-17.
//

import Foundation

import CoreLocation

final class WeatherAPIClient: NSObject,ObservableObject, CLLocationManagerDelegate {
    var currentWeather: Current?
    let apiKey = "8d00f4f521c5478f8ba225857231704"
    private let locationManager = CLLocationManager()
    private let dateFormatter = ISO8601DateFormatter()
    
    override init() {
        super.init()
        locationManager.delegate = self
        requestLocation()
    }

    func fetchWeather() async {
        guard let location = locationManager.location else {
            requestLocation()
            return
        }
        
        guard let url = URL(string: "http://api.weatherapi.com/v1/current.json?q=Toronto&key=\(apiKey)") else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
                        if let weatherResponse = try? JSONDecoder().decode(WeatherModel.self, from: data) {
                            print(weatherResponse.data)
//                            currentWeather = weatherResponse.data.timelines.first?.intervals.first?.values
                        }
                    } catch {
                        print("Error")
                        // handle the error
                    }
                }
                
                private func requestLocation() {
                    locationManager.requestWhenInUseAuthorization()
                    locationManager.requestLocation()
                }
                
                func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                    Task { await fetchWeather() }
                }

                func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
                    // handle the error
                }
            }
