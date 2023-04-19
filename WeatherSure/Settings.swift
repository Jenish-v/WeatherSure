//
//  Settings.swift
//  WeatherSure
//
//  Created by Jagtar Singh matharu on 2023-03-24.
//
import SwiftUI

struct SettingsView: View {

    // View model for the settings view
    @State var backgroundColor = Color.blue
    @State var selectedTemperatureUnit = 0
    @State var temperatureUnits = ["Celsius", "Fahrenheit"]
    @State var showHourlyTemperature = true
    @State var showDailyTemperatureForToday = true
    @State var showDailyTemperatureForTomorrow = true

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Appearance")) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Background color")
                        ColorPicker("", selection: $backgroundColor)
                            .frame(width: 100, height: 50)
                    }
                }

                Section(header: Text("Saved locations")) {
                    Button(action: { /* remove saved locations */ }) {
                        Text("Remove all saved locations")
                            .foregroundColor(.red)
                    }
                }

                Section(header: Text("Temperature units")) {
                    HStack {
                        ForEach(0..<2) { index in
                            Button(action: {
                                selectedTemperatureUnit = index
                            }) {
                                Text(temperatureUnits[index])
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 8)
                                    .background(selectedTemperatureUnit == index ? Color.blue : Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                    }
                }


                Section(header: Text("Hourly temperature")) {
                    Toggle("Show hourly temperature", isOn: $showHourlyTemperature)
                }

                Section(header: Text("Daily temperature")) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Show daily temperature for")
                        HStack {
                            Toggle("Today", isOn: $showDailyTemperatureForToday)
                            Spacer()
                            Toggle("Tomorrow", isOn: $showDailyTemperatureForTomorrow)
                        }
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
