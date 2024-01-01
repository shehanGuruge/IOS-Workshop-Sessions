//
//  Usecase.swift
//  Sesssion 6
//
//  Created by Shehan Guruge on 2023-08-10.
//

import Foundation

protocol Usecase {
    associatedtype Params
    associatedtype Result
    
    func call(parameters: Params?) async -> AppResult<Result, Failure>
}
