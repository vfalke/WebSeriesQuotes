//
//  StringExt.swift
//  BBQuotes
//
//  Created by Vipin Falke on 14/07/25.
//

extension String {
    func removeSpaces() -> String {
        self.replacingOccurrences(of: " ", with: "")
    }
    
    func removeCaseAndSpaces() -> String {
        self.lowercased().removeSpaces()
    }
}
