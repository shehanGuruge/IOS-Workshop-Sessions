//
//  WeatherRemoteDatasourceImpl.swift
//  Sesssion 6
//
//  Created by Shehan Guruge on 2023-08-10.
//

import Foundation

struct WeatherRemoteDatasourceImpl: WeatherRemoteDatasource {
    var apiService: APIService
    private let decoder = JSONDecoder()
    
    
    func getCurrentWeather(city: String) async throws -> WeatherModel? {
        do {
            let response = try await apiService.get(path:"weather?q=\(city)&appid=9747e9f07ef0c80a7cad75e0ac432bde&units=metric")
            return try decoder.decode(WeatherModel.self, from: response)
        } catch {
            throw error
        }
    }
}
