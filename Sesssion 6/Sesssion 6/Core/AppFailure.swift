//
//  AppFailure.swift
//  Sesssion 6
//
//  Created by Shehan Guruge on 2023-08-10.
//

import Foundation

protocol Failure {
    
}

enum ApiFailure: Failure {
    case unknown
    case badResponse(HttpFailure)
}

enum AppFailure: Failure {
    case unknown
}

