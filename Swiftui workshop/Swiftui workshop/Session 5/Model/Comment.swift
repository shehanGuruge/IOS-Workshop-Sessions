//
//  Comment.swift
//  Swiftui workshop
//
//  Created by Shehan Guruge on 2023-06-26.
//

import Foundation

struct Comment: Codable, Identifiable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
