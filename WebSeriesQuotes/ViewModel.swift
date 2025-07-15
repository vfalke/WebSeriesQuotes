//
//  ViewModel.swift
//  BBQuotes
//
//  Created by Vipin Falke on 03/07/25.
//

import Foundation

@Observable
@MainActor
class ViewModel {
    
    enum FetchStatus {
        case notStarted
        case fetching
        case succss
        case failed(error: Error)
    }
    
    private(set) var status: FetchStatus = .notStarted
    
    private let fetcher = FetchService()
    
    var quote: Quote
    var character: Char
    
    init() {
        quote = Quote(quote: "My name is Walter Hartwell White. I live at 308 Negra Arroyo Lane, Albuquerque, New Mexico 87104.", character: "Walter White")
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let characterData = try! Data(contentsOf: Bundle.main.url(forResource: "samplecharacter", withExtension: "json")!)
        character = try! decoder.decode(Char.self, from: characterData)
        
    }
    
    
    func getData(for show: String) async {
        status = .fetching
        do {
            quote = try await fetcher.fetchQuotes(from: show)
            character = try await fetcher.fetchCharacter(quote.character)
            character.death = try await fetcher.fetchDeath(for: character.name)
            status = .succss
        } catch {
            status = .failed(error: error)
        }
        
    }
}
