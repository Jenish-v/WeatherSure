import SwiftUI

struct HourlyWeatherView: View {

    let weatherData: [HourlyWeather]=[
        HourlyWeather(time: "12:00 AM", iconName: "sun.max.fill", temperature: 72, feelsLikeTemperature: 74, windSpeed: 5, airQuality: "Good", humidity: 60),
        HourlyWeather(time: "01:00 AM", iconName: "moon.fill", temperature: 68, feelsLikeTemperature: 72, windSpeed: 6, airQuality: "Moderate", humidity: 62),
        HourlyWeather(time: "02:00 AM", iconName: "moon.fill", temperature: 64, feelsLikeTemperature: 68, windSpeed: 6, airQuality: "Moderate", humidity: 65),
        HourlyWeather(time: "03:00 AM", iconName: "moon.fill", temperature: 64, feelsLikeTemperature: 68, windSpeed: 6, airQuality: "Moderate", humidity: 65),
        HourlyWeather(time: "04:00 AM", iconName: "moon.fill", temperature: 64, feelsLikeTemperature: 68, windSpeed: 6, airQuality: "Moderate", humidity: 65),
        HourlyWeather(time: "05:00 AM", iconName: "moon.fill", temperature: 64, feelsLikeTemperature: 68, windSpeed: 6, airQuality: "Moderate", humidity: 65),
        // add more hourly weather data here
    ]
    var body: some View {
        
        VStack{
            Image(systemName: "cloud.sun.fill")
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 100, height: 100)
                           .padding()
                           .foregroundColor(Color.accentColor)
            Text("Hourly Forecast")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom,170)
            
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(weatherData) { weather in
                        VStack(alignment: .center, spacing: 10) {
                            Text(weather.time)
                                .font(.headline)
                            Image(systemName: weather.iconName)
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("\(weather.temperature)°F")
                                .font(.subheadline)
                            Text("Feels like \(weather.feelsLikeTemperature)°F")
                                .font(.footnote)
                            Divider()
                            HStack {
                                Image(systemName: "wind")
                                Text("\(weather.windSpeed) mph")
                            }
                            HStack {
                                Image(systemName: "aqi.medium")
                                Text(weather.airQuality)
                            }
                            HStack {
                                Image(systemName: "drop")
                                Text("\(weather.humidity)%")
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom,150)

            }
        }
    }
}
//data model


struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
       
        HourlyWeatherView()
    }
}

