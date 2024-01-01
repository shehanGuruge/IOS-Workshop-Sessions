//
//  ProductRepository.swift
//  Clean Architecture
//
//  Created by Shehan Guruge on 2023-08-07.
//

import Foundation


protocol WeatherRepository {
    func getCurrentWeather (location: String) async -> CustomResult<WeatherEntity?, Failure>
    
}
