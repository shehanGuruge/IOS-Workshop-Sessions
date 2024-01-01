//
//  WeatherDatasource.swift
//  Clean Architecture
//
//  Created by Shehan Guruge on 2023-08-08.
//

import Foundation

protocol WeatherRemoteDatasource {
    func getCurrentWeather(location: String) async throws -> WeatherModel?
}
