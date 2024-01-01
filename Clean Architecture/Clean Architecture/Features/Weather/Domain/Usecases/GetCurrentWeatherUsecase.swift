//
//  GetCurrentWeatherUsecase.swift
//  Clean Architecture
//
//  Created by Shehan Guruge on 2023-08-08.
//

import Foundation

struct GetCurrentWeatherUsecase: Usecase {
    var repository: WeatherRepository
    func call(parameters: String?) async -> CustomResult<WeatherEntity?, Failure>  {
        return await repository.getCurrentWeather(location: parameters!)
    }
}
