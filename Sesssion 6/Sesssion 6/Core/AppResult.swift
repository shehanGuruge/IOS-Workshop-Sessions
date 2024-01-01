//
//  AppResult.swift
//  Sesssion 6
//
//  Created by Shehan Guruge on 2023-08-10.
//

import Foundation

enum AppResult<T, Failure> {
    case success(T)
    case failure(Failure)
}
