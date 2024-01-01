//
//  AppResult.swift
//  Clean Architecture
//
//  Created by Shehan Guruge on 2023-08-09.
//

import Foundation

enum CustomResult<T, Failure> {
    case success(T)
    case failure(Failure)
}
