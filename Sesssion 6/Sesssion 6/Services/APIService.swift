//
//  APIService.swift
//  Sesssion 6
//
//  Created by Shehan Guruge on 2023-08-10.
//

import Foundation


class APIService {
    
    private let baseUrl = URL(string: "https://api.openweathermap.org/data/2.5/")!
    private let decoder = JSONDecoder()

    func get(path:String) async throws -> Data {
        print(path)
        let url = URL(string: path, relativeTo: baseUrl)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField:"Content-Type")
        request.timeoutInterval = 60.0
        let (data,responseData) = try await URLSession.shared.data(for: request)
        let response = responseData as? HTTPURLResponse
        if(response?.statusCode != 200){
            let failure = HttpFailure(code: response!.statusCode, message: response!.description)
            throw ApiError.badResponse(failure)
        }
        return data
    }
    
}
