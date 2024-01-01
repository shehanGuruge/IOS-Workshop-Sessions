//
//  WeatherRemoteDatasourceImpl.swift
//  Clean Architecture
//
//  Created by Shehan Guruge on 2023-08-08.
//

import Foundation

struct WeatherRemoteDatasourceImpl : WeatherRemoteDatasource {
    
    var apiService: APIService
    private let decoder = JSONDecoder()
  
    func getCurrentWeather(location: String) async throws -> WeatherModel? {
        do {
            let response = try await apiService.get(path:"weather?q=\(location)&appid=9747e9f07ef0c80a7cad75e0ac432bde&units=metric")
            return try decoder.decode(WeatherModel.self, from: response)
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
}
