//
//  DI.swift
//  Clean Architecture
//
//  Created by Shehan Guruge on 2023-08-08.
//

import Foundation
import Factory

extension Container {
    var weatherRemoteDatasource: Factory<WeatherRemoteDatasource> {
        self {WeatherRemoteDatasourceImpl(apiService: self.apiService())}.singleton
    }
    var weatherRepository: Factory<WeatherRepository> {
        self {WeatherRepositoryImpl(weatherRemoteDatasource: self.weatherRemoteDatasource())}.singleton
    }
    var getCurrentWeatherUsecase: Factory<GetCurrentWeatherUsecase> {
        self {
            GetCurrentWeatherUsecase(repository: self.weatherRepository())
        }.singleton
    }
    var apiService: Factory<APIService> {
        self {APIService()}.singleton
    }
    var weatherViewModel: Factory<WeatherViewModel>{
         self {WeatherViewModel(weatherUsecase: self.getCurrentWeatherUsecase())}
    }
}
