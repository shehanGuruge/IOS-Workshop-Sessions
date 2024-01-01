//
//  ContentView.swift
//  Clean Architecture
//
//  Created by Shehan Guruge on 2023-08-07.
//

import SwiftUI
import Factory

struct HomeView: View {
    
    @StateObject var weatherViewModel = Container.shared.weatherViewModel()
    
    var body: some View {
        VStack(spacing: 20){
            
            Text("Open Weather")
                .font(.system(.title))
            
            TextField("City Name", text: $weatherViewModel.city)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Button{
                weatherViewModel.getCurrentWeather()
            } label: {
                if(weatherViewModel.isLoading){
                    ProgressView()
                }else{
                    Text("Get Weather")
                }
                
            }
            .disabled(weatherViewModel.isLoading)
            .buttonStyle(.borderedProminent)
            .alert(isPresented: $weatherViewModel.displayError) {
                Alert(title: Text(weatherViewModel.errorMessage), dismissButton: .default(Text("Okay")))
            }
            
            
            if(weatherViewModel.weatherEntity?.temp != nil){
                Text("Temp: \(Int(weatherViewModel.weatherEntity!.temp)) \u{2103}")
            }else{
                Text("Search for a weather by city name")
            }
            
        }
               
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
