//
//  WeatherView.swift
//  Sesssion 6
//
//  Created by Shehan Guruge on 2023-08-10.
//

import SwiftUI
import Factory

struct WeatherView: View {
    @StateObject var weatherViewModel: WeatherViewModel = Container.shared.weatherViewModel()
    
    var body: some View {
        VStack() {
            TextField("Enter the city", text: $weatherViewModel.city)
            
            Button {
                weatherViewModel.getWeather()
            } label: {
                if(weatherViewModel.isLoading){
                    ProgressView()
                } else {
                    Text("Get Weather")
                }
            }
            .disabled(weatherViewModel.isLoading)
            .buttonStyle(.borderedProminent)
            .alert(isPresented: $weatherViewModel.showError){
                Alert(title: Text(weatherViewModel.errorMessage),
                      dismissButton: .default(Text("OK")))
            }
            
            
            if(weatherViewModel.weatherEntity != nil) {
                Text("Temp: \(weatherViewModel.weatherEntity!.temp) \u{2103}")
            } else {
                Text("Type a city to search")
            }
        }
        .padding()
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
