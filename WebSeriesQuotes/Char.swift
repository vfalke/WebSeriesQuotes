//
//  Char.swift
//  BBQuotes
//
//  Created by Vipin Falke on 25/06/25.
//

import Foundation

struct Char: Codable {
    let name: String
    let birthday: String
    let occupations: [String]
    let images: [URL]
    let aliases: [String]?
    let status: String
    let portrayedBy: String // coding keys
    var death: Death?
}
