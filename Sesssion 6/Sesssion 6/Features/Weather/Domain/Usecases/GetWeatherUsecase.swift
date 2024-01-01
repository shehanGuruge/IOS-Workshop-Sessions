//
//  GetWeatherUsecase.swift
//  Sesssion 6
//
//  Created by Shehan Guruge on 2023-08-10.
//

import Foundation

struct GetWeatherUsecase: Usecase {
    var weatherRepository: WeatherRepository
    
    func call(parameters: String?) async -> AppResult<WeatherEntity?, Failure> {
        return await weatherRepository.getWeather(city: parameters!)
    }
}
