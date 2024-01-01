//
//  WeatherRepositoryImpl.swift
//  Clean Architecture
//
//  Created by Shehan Guruge on 2023-08-08.
//

import Foundation
import Factory


struct WeatherRepositoryImpl: WeatherRepository {
    var weatherRemoteDatasource: WeatherRemoteDatasource

    func getCurrentWeather(location: String) async -> CustomResult<WeatherEntity?, Failure> {
        do {
            let response = try await weatherRemoteDatasource.getCurrentWeather(location: location)
            return .success(response?.toEntity())
        } catch let error as ApiError {
            return .failure(error.getFailure())
        } catch {
            return .failure(AppFailure.unknown)
        }
    }
}
