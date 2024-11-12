//
//  DataModels.swift
//  SwiftFMI_hwk1
//
//  Created by Ivaylo Atanasov on 12.11.24.
//

import Foundation

struct Book: Decodable {
    let title: String?
    let description: String?
    let chapters: [Chapter]?
}

struct Chapter: Decodable {
    let id: String?
    let type: String?
    let title: String?
    let text: String?
    let actions: [Action]?
}

struct Action: Decodable {
    let description: String?
    let next: String?
}
