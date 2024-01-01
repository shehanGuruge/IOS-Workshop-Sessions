//
//  DIContainer.swift
//  Sesssion 6
//
//  Created by Shehan Guruge on 2023-08-10.
//

import Foundation
import Factory

extension Container {
    var weatherViewModel: Factory<WeatherViewModel> {
        self {
            WeatherViewModel(getWeatherUsecase: self.getWeatherUsecase())
        }
    }
    
    var getWeatherUsecase: Factory<GetWeatherUsecase> {
        self {
            GetWeatherUsecase(weatherRepository: self.weatherRepository())
        }.singleton
    }
    
    
    var apiService: Factory<APIService> {
        self {
            APIService()
        }.singleton
    }
    
    var weatherRemoteDataSource: Factory<WeatherRemoteDatasource> {
        self {
            WeatherRemoteDatasourceImpl(apiService: self.apiService())
        }.singleton
    }
    
    var weatherRepository: Factory<WeatherRepository> {
        self {
            WeatherRepositoryImpl(weatherRemoteDatasource: self.weatherRemoteDataSource())
        }.singleton
    }
}
