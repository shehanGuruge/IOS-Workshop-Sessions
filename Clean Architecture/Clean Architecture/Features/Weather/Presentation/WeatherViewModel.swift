//
//  WeatherViewModel.swift
//  Clean Architecture
//
//  Created by Shehan Guruge on 2023-08-08.
//

import Foundation
import Factory

class WeatherViewModel: ObservableObject {
    var weatherUsecase: GetCurrentWeatherUsecase
    
    init(weatherUsecase: GetCurrentWeatherUsecase) {
        self.weatherUsecase = weatherUsecase
    }
    
    @Published var weatherEntity: WeatherEntity?
    @Published var city: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = "" {
        willSet(newValue) {
            if(newValue.isEmpty) {
                displayError = false
            } else {
                displayError = true
            }
        }
    }
    @Published var displayError: Bool = false
    
    func getCurrentWeather () {
        Task {
            if(!city.isEmpty) {
                invokeUIThread {
                    self.isLoading = true
                }
                let response = await weatherUsecase.call(parameters: city)
                switch(response){
                case .success(let weatherEntity):
                    invokeUIThread {
                        self.isLoading = false
                        self.weatherEntity = weatherEntity
                    }
                case .failure(let error):
                    handleError(error: error)
                }
            } else {
                invokeUIThread {
                    self.isLoading = false
                    self.errorMessage = "Please enter a valid city"
                }
            }
        }
    }
    
    
    private func handleError(error: Failure) {
        var errorDesc = ""
        switch(error) {
        case ApiFailure.unknown:
            errorDesc = "A server error occurred"
        case ApiFailure.badResponse(let failure):
            errorDesc = failure.message
        case ApiFailure.unknown:
            errorDesc = "An unexpected error occurred"
        default:
            errorDesc = ""
        }
        
        invokeUIThread {
            self.isLoading = false
            self.errorMessage = errorDesc
        }
    }
    
    
    private func invokeUIThread(action: @escaping () -> ()) {
        DispatchQueue.main.async {
            action()
        }
    }
}
