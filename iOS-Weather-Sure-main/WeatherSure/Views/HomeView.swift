import SwiftUI

struct City: Decodable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population: Int
    let timezone: Int

    struct Coord: Decodable {
        let lat: Double
        let lon: Double
    }
}

struct CityData: Decodable {
    let dt: TimeInterval
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let sys: Sys
    let dtTxt: String

    struct Main: Decodable {
        let temp: Double
        let feelsLike: Double
        let tempMin: Double
        let tempMax: Double
        let pressure: Double
        let seaLevel: Double
        let grndLevel: Double
        let humidity: Int
        let tempKf: Double
    }

    struct Weather: Decodable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }

    struct Clouds: Decodable {
        let all: Int
    }

    struct Wind: Decodable {
        let speed: Double
        let deg: Int
    }

    struct Sys: Decodable {
        let pod: String
    }
}

struct CityResult: Decodable {
    let city: City
    let cod: String
    let message: Float
    let cnt: Int
    let list: [CityData]
}

class WeatherViewModel: ObservableObject {
    @Published var cityResults: [CityResult] = []

    func searchCities(query: String, apiKey: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/find?q=\(query)&appid=\(apiKey)") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let cityResults = try JSONDecoder().decode([CityResult].self, from: data)
                DispatchQueue.main.async {
                    self.cityResults = cityResults
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct HomeView: View {
    @ObservedObject var weatherViewModel = WeatherViewModel()
    @State private var searchQuery: String = ""

    var body: some View {
        VStack {
            TextField("Search City", text: $searchQuery, onCommit: {
                weatherViewModel.searchCities(query: searchQuery, apiKey: "bc64ba82020930acf1749b732ad235a3")
            })
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            List(weatherViewModel.cityResults, id: \.city.id) { cityResult in
                VStack(alignment: .leading) {
                    Text(cityResult.city.name)
                        .font(.headline)
                    Text("Temperature: \(cityResult.list.first?.main.temp ?? 0)°C")
                        .font(.subheadline)
                }
            }
        }
        .padding()
    }
}

