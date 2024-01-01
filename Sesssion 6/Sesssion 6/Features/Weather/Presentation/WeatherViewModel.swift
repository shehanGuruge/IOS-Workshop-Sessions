//
//  WeatherViewModel.swift
//  Sesssion 6
//
//  Created by Shehan Guruge on 2023-08-10.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    var getWeatherUsecase: GetWeatherUsecase
    @Published var city: String = ""
    @Published var isLoading: Bool = false
    @Published var weatherEntity: WeatherEntity?
    @Published var errorMessage: String = "" {
        willSet(newValue) {
            if(newValue.isEmpty) {
                showError = false
            } else {
                showError = true
            }
        }
    }
    @Published var showError: Bool = false
    
    init(getWeatherUsecase: GetWeatherUsecase) {
        self.getWeatherUsecase = getWeatherUsecase
    }
    
    func getWeather() {
        if(!city.isEmpty) {
            self.isLoading = true
            
            Task {
                let response = await getWeatherUsecase.call(parameters: city)
                switch(response) {
                case .success(let weatherEntity):
                    invokeUIThread {
                        self.weatherEntity = weatherEntity
                        self.isLoading = false
                    }
                case .failure(let failure):
                    handleErrors(failure: failure)
                }
            }
            
        } else {
            self.errorMessage = "Please enter a city"
            self.isLoading = false
        }
    }
    
    private func handleErrors(failure: Failure) {
        var errorDescription = ""
        
        switch(failure) {
        case AppFailure.unknown:
            errorDescription = "Something happened. Please try again later"
        case ApiFailure.unknown:
            errorDescription = "An unexpected error occured"
        case ApiFailure.badResponse(let httpFailure):
            errorDescription = httpFailure.message
        default:
            errorDescription = "Error!"
        }
        
        invokeUIThread {
            self.errorMessage = errorDescription
            self.isLoading = false
        }
    }
    
    
    private func invokeUIThread(action: @escaping () -> ()) {
        DispatchQueue.main.async {
            action()
        }
    }
}
