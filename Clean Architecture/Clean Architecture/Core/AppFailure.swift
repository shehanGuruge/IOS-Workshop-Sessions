//
//  AppFailure.swift
//  Clean Architecture
//
//  Created by Shehan Guruge on 2023-08-09.
//

import Foundation

protocol Failure {}

enum ApiFailure: Failure {
    case unknown
    case badResponse(HttpFailure)
}

enum AppFailure: Failure {
    case unknown
}

