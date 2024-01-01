//
//  Error.swift
//  Swiftui workshop
//
//  Created by Shehan Guruge on 2023-06-26.
//

import Foundation

struct HttpFailure {
    let code: Int
    let message: String
}

enum ApiError: Error {
    case unknown
    case badResponse(HttpFailure)
}
