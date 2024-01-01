//
//  WeatherRemoteDatasource.swift
//  Sesssion 6
//
//  Created by Shehan Guruge on 2023-08-10.
//

import Foundation


protocol WeatherRemoteDatasource {
    func getCurrentWeather(city: String) async throws -> WeatherModel?
    
}
