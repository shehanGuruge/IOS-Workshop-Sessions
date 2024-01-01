//
//  AppError.swift
//  Sesssion 6
//
//  Created by Shehan Guruge on 2023-08-10.
//

import Foundation


enum AppError: Error {
    case unknown
}

struct HttpFailure {
    let code: Int
    let message: String
}

enum ApiError: Error {
    case unknown
    case badResponse(HttpFailure)
}

extension ApiError {
    func getFailure() -> ApiFailure {
        switch(self){
        case .unknown:
            return ApiFailure.unknown
        case .badResponse(let error):
            return .badResponse(error)
        }
    }
}
