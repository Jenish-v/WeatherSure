//
//  HomeView.swift
//  WeatherSure
//
//  Created by Pooja Panirwala on 2023-03-22.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var weatherAPIClient = WeatherAPIClient()
    @State private var search = ""
    @State private var selectedTime = Date()
    @State private var showToggle = true
    var body: some View {
        ZStack {
            
            TabView {
                // First tab content for Home
                NavigationView {
                    
                    ZStack {
                        
                        Color(red: 0.902, green: 0.890, blue: 0.851)
                            .ignoresSafeArea(.all)
                        Text("LOCATIONS")
                        .foregroundColor(Color.brown)
                        .font(.system(size: 26, weight: .bold))
                        .offset(y: -UIScreen.main.bounds.height / 3)
                            List {
                                
                                // Show current location at the top
//                                HStack {
//                                    
//                                    Text("Current Location")
//                                    Spacer()
//                                    Text("72°F")
//                                }
//                                .padding(.vertical)
//                                
//                                // Example location and temperature data
//                                HStack {
//                                    Text("New York")
//                                    Spacer()
//                                    Text("60°F")
//                                }
//                                .padding(.vertical)
//                                HStack {
//                                    Text("Los Angeles")
//                                    Spacer()
//                                    Text("70°F")
//                                }
//                                .padding(.vertical)
//                                HStack {
//                                    Text("Chicago")
//                                    Spacer()
//                                    Text("55°F")
//                                }
//                                .padding(.vertical)
                            }
                            .listStyle(PlainListStyle())
                            .padding(.top, 50)
                            .foregroundColor(Color.brown)
                            .font(.system(size: 22, weight: .medium))
                            .offset(y: UIScreen.main.bounds.height / 5)
                        
                        
                        // Search bar
                        TextField("Search here", text: $search)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(30)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                            .offset(y: -UIScreen.main.bounds.height / 4)
                    }
                    .onAppear {
//                                Task {
//                                    await weatherAPIClient.fetchWeather()
//                                }
                        getWeather()
                            }
                    //.navigationBarTitle(Text("Home"))
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                NavigationView {
                    // Second tab content for Saved Locations
                    ZStack {
                        Color(red: 0.902, green: 0.890, blue: 0.851)
                            .ignoresSafeArea(.all)
                        Text("Saved LOCATIONS")
                        .foregroundColor(Color.brown)
                        .font(.system(size: 24, weight: .bold))
                        .offset(y: -UIScreen.main.bounds.height / 3)
//                        .offset(x:-UIScreen.main.bounds.width / 6)
                        List {
                            // Example location and temperature data
                            HStack {
                                Text("New York")
                                Spacer()
                                Text("60°F")
                            }
                            .padding(.vertical)
                            HStack {
                                Text("Los Angeles")
                                Spacer()
                                Text("70°F")
                            }
                            .padding(.vertical)
                            HStack {
                                Text("Chicago")
                                Spacer()
                                Text("55°F")
                            }
                            .padding(.vertical)
                        }
                        .foregroundColor(Color.brown)
                        .font(.system(size: 22, weight: .medium))
                        .listStyle(PlainListStyle())
                        .padding(.top, 50)
                        .offset(y: UIScreen.main.bounds.height / 10)
                        
                    }
                }
            
                    .tabItem {
                        Image(systemName: "location")
                        Text("Saved Locations")
                    }
                
                // Third tab content for Settings
                NavigationView {
                    // Second tab content for Saved Locations
                    ZStack {
                        Color(red: 0.902, green: 0.890, blue: 0.851)
                            .ignoresSafeArea(.all)
                        Text("Settings")
                        .foregroundColor(Color.brown)
                        .font(.system(size: 24, weight: .bold))
                        .offset(y: -UIScreen.main.bounds.height / 3)
//                        .offset(x:-UIScreen.main.bounds.width / 3)
                        VStack {
                            Toggle("Send Notification",isOn: $showToggle)
                                .font(.system(size: 18, weight: .medium))
                                .offset(y: -UIScreen.main.bounds.height / 4)
                                .padding()
                        }
                        VStack {
                                Text("Notification Time")
                                .font(.system(size: 18, weight: .medium))
                                .offset(y: -UIScreen.main.bounds.height / 8)
                                .offset(x:-UIScreen.main.bounds.width / 3.6)
                                
                                    DatePicker(
                                        "",
                                        selection: $selectedTime,
                                        displayedComponents: .hourAndMinute
                                    )
                                    .datePickerStyle(GraphicalDatePickerStyle())
                                    .font(.system(size: 18, weight: .medium))
                                    .offset(y: -UIScreen.main.bounds.height / 5)
                                    .padding()
                                }
                        VStack {
                            Text("About WeatherSure")
                                .foregroundColor(Color.brown)
                                .font(.system(size: 20, weight: .bold))
                                .offset(y: -UIScreen.main.bounds.height / 9)
                                .offset(x:-UIScreen.main.bounds.width / 4.4)
                                .padding()
                        }
                        VStack {
                            Text("WeatherSure is a Weather Application. The purpose of the project is to develop an application in which users can view current temperature and other weather- related details of a particular location.")
                                .frame(maxWidth: .infinity)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .offset(y: UIScreen.main.bounds.height / 80)
                        }
                        VStack {
                            NavigationLink("Personalize your notifications here", destination: PersonalizationView())
                                .foregroundColor(Color.blue)
                                .font(.system(size: 18, weight: .medium))
                                .offset(y: UIScreen.main.bounds.height / 8)
                                .offset(x:-UIScreen.main.bounds.width / 11)
                                .padding()
                                
                        }
                        VStack {
                            NavigationLink("How to Integrate WeatherApp to other apps?", destination: IntegrationView())
                                .frame(maxWidth: .infinity)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.blue)
                                .font(.system(size: 18, weight: .medium))
                                .offset(y: UIScreen.main.bounds.height / 6)
                                .offset(x:UIScreen.main.bounds.width / 70)
//                                .padding()
                        }
                        VStack {
                            Text("Contact Us")
                                .foregroundColor(Color.brown)
                                .font(.system(size: 20, weight: .bold))
                                .offset(y: UIScreen.main.bounds.height / 3.5)
                                .offset(x:-UIScreen.main.bounds.width / 3.1)
                                .padding()
                            Text("contactus@weathersure.com")
                                .font(.system(size: 16, weight: .semibold))
                                .offset(y: UIScreen.main.bounds.height / 4)
                                .offset(x:-UIScreen.main.bounds.width / 5.8)
                                .padding()
                        }
                        VStack {
                            NavigationLink("We appreciate your feedback!", destination: FeedbackView())
                                .frame(maxWidth: .infinity)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.blue)
                                .font(.system(size: 18, weight: .medium))
                                .offset(y: UIScreen.main.bounds.height / 3)
                                .offset(x:-UIScreen.main.bounds.width / 7)
//                                .padding()
                        }
                    }
                }
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    
            }
            .accentColor(Color.brown)
            .foregroundColor(Color.black)
            .edgesIgnoringSafeArea(.top) // Ignore the safe area at the top
        }
    }
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
    let timeFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter
        }()
    func getWeather(){
                    if let currentWeather = weatherAPIClient.currentWeather  {
                        HStack(alignment: .center, spacing: 16) {
//                            currentCondition?.icon.image
//                                .font(.largeTitle)
                            Text("\(currentWeather.tempC)º")
                                .font(.largeTitle)
                        }
                        Text((currentWeather.condition.text)!)
                            .font(.body)
                            .multilineTextAlignment(.center)
                    } else {
                        Text("No weather info available yet.\nTap on refresh to fetch new data.\nMake sure you have enabled location permissions for the app.")
                            .font(.body)
                            .multilineTextAlignment(.center)
                        Button("Refresh", action: {
                            Task {
                                await weatherAPIClient.fetchWeather()
                            }
                        })
                }
            
            }
//        .onAppear {
//            Task {
//                await weatherAPIClient.fetchWeather()
//            }
//        }
}
