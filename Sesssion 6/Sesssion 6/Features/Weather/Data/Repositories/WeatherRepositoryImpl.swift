//
//  WeatherRepositoryImpl.swift
//  Sesssion 6
//
//  Created by Shehan Guruge on 2023-08-10.
//

import Foundation

struct WeatherRepositoryImpl: WeatherRepository {
    var weatherRemoteDatasource: WeatherRemoteDatasource
    
    
    func getWeather(city: String) async -> AppResult<WeatherEntity?, Failure> {
        do {
            let response =  try await weatherRemoteDatasource.getCurrentWeather(city: city)
            return .success(response?.toEntity())
        } catch let error as ApiError {
            return .failure(error.getFailure())
        } catch {
            return .failure(AppFailure.unknown)
        }
    }
}
