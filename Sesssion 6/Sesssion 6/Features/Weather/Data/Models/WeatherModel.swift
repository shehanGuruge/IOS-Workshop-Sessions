//
//  WeatherModel.swift
//  Sesssion 6
//
//  Created by Shehan Guruge on 2023-08-10.
//

import Foundation


struct WeatherModel: Decodable  {
    let main: MainModel
    
    struct MainModel: Decodable {
        let temp: Double
    }
}

extension WeatherModel {
    func toEntity() -> WeatherEntity {
        return WeatherEntity(temp: self.main.temp)
    }
}
