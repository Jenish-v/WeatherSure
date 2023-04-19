//
//  ContentView.swift
//  WeatherSure
//
//  Created by Sakshi Patel on 2023-03-16.
//

import SwiftUI

struct ContentView: View {
    @State private var isSignupFormLoaded = false
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
        
    var body: some View {
        
        ZStack {
            Color(red: 0.902, green: 0.890, blue: 0.851)
                .ignoresSafeArea(.all)
            Image("loginlogo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: UIScreen.main.bounds.height / 3)
                .offset(y: -UIScreen.main.bounds.height / 3.5) // Set a negative offset to lift the image up
//            HStack{
//                Button("Login") {
//                    self.isSignupFormLoaded = false
//                }
//                .padding()
//                .font(.system(size: 20, weight: .bold))
//                .foregroundColor(self.isSignupFormLoaded ? Color.gray : Color.yellow)
//                //.foregroundColor(.white)
//                .cornerRadius(10)
//
//                Image("dash")
//
//                Button("Signup") {
//                    self.isSignupFormLoaded = true
//                }
//                .padding()
//                .font(.system(size: 20, weight: .bold))
//                .foregroundColor(self.isSignupFormLoaded ? Color.yellow : Color.gray)
//                .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            .padding(.horizontal)
//                        .offset(y: UIScreen.main.bounds.height / 80)
//                        .offset(y: -UIScreen.main.bounds.height / 12)
            
            VStack{
                HStack{
                    Button("Login") {
                        self.isSignupFormLoaded = false
                    }
                    .padding()
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(self.isSignupFormLoaded ? Color.gray : Color.yellow)
                    //.foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .offset(y: UIScreen.main.bounds.height / 15)
                    Image("dash")
                        .padding(.horizontal)
                        .offset(y: UIScreen.main.bounds.height / 15)
                    Button("Signup") {
                        self.isSignupFormLoaded = true
                    }
                    .padding()
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(self.isSignupFormLoaded ? Color.yellow : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    .padding(.horizontal)
                    .offset(y: UIScreen.main.bounds.height / 15)
                }
                            
                            if isSignupFormLoaded {
                                TextField("Name", text: $name)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                    .padding(.bottom, 10)
                                    .offset(y: UIScreen.main.bounds.height / 20)
                                
                                TextField("Email", text: $email)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                    .padding(.bottom, 10)
                                    .offset(y: UIScreen.main.bounds.height / 20)
                                
                                SecureField("Password", text: $password)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                    .offset(y: UIScreen.main.bounds.height / 20)
                                
                                Button(action: {
                                                navigateToLoginView()
                                            }) {
                                                Text("SignUp")
                                            }
                                .padding()
                                .background(Color.white)
                                .foregroundColor(Color.black)
                                .cornerRadius(30)
                                .padding(.horizontal)
                                .offset(y: UIScreen.main.bounds.height / 10)

                                
                            } else {
                                TextField("Name", text: $name)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                    .padding(.bottom, 10)
                                    .offset(y: UIScreen.main.bounds.height / 20)
                                
                                TextField("Email", text: $email)
                                    .padding()
                                    .background(Color.white)
                                
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                    .offset(y: UIScreen.main.bounds.height / 20)
                                
                                
                                Button("Forgot password?") {
                                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                }
                                .padding()
                                .foregroundColor(Color.white)
                                .font(.system(size: 19, weight: .bold))
                                .offset(y: UIScreen.main.bounds.height / 30)
                                
                                Button(action: {
                                                navigateToHomeView()
                                            }) {
                                                Text("LogIn")
                                            }
                                .padding()
                                .background(Color.white)
                                .foregroundColor(Color.black)
                                .cornerRadius(30)
                                .padding(.horizontal)
                                .offset(y: UIScreen.main.bounds.height / 10)
                            }
                        }
        }
    }
    func navigateToHomeView() {
        let homeView = HomeView()
        let homeViewWrapper = NavigationView { homeView }
        UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: homeViewWrapper)
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    func navigateToLoginView() {
        let homeView = ContentView()
        let homeViewWrapper = NavigationView { homeView }
        UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: homeViewWrapper)
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
