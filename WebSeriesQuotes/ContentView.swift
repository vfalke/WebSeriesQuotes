//
//  ContentView.swift
//  BBQuotes
//
//  Created by Vipin Falke on 25/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Breaking Bad", systemImage: "tortoise") {
                QuoteView(show: "Breaking Bad")                    
            }
            
            Tab("Better Call Saul", systemImage: "briefcase") {
                QuoteView(show: "Better Call Saul")
            }
        }
    }
}

#Preview {
    ContentView()
}

/*
 
 @State

 @Binding

 @ObservedObject

 @Published

 @StateObject

 @EnvironmentObject

 @AppStorage

 @FocusState

 @Observable (Swift 5.9+)
 
 
 */
