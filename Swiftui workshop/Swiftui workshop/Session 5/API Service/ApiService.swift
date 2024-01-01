//
//  ApiService.swift
//  Swiftui workshop
//
//  Created by Shehan Guruge on 2023-06-26.
//

import Foundation

class ApiService {
    static let shared = ApiService()
    private init(){}
    
    private let baseUrl = URL(string: "https://jsonplaceholder.typicode.com/")!
    private let decoder = JSONDecoder()

    func get<T: Codable>(path:String) async throws -> T {
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
        return try decoder.decode(T.self, from: data)
    }
    
}
