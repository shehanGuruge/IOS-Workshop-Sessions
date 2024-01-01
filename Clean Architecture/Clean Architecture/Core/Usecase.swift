//
//  Usecase.swift
//  Clean Architecture
//
//  Created by Shehan Guruge on 2023-08-08.
//

import Foundation

protocol Usecase {
    associatedtype ResultType
    associatedtype Params
    
    func call(parameters: Params?) async -> CustomResult<ResultType?, Failure>
}
