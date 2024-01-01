//
//  WeatherRepository.swift
//  Sesssion 6
//
//  Created by Shehan Guruge on 2023-08-10.
//

import Foundation

protocol WeatherRepository {
    func getWeather(city: String) async -> AppResult<WeatherEntity?, Failure>
}
