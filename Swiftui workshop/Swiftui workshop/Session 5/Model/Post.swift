//
//  Post.swift
//  Swiftui workshop
//
//  Created by Shehan Guruge on 2023-06-26.
//

import Foundation

struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
