//
//  CharacterView.swift
//  BBQuotes
//
//  Created by Vipin Falke on 07/07/25.
//

import SwiftUI

struct CharacterView: View {
    let character: Char
    let show: String
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Image(show.removeCaseAndSpaces())
                    .resizable()
                    .scaledToFit()
                
                ScrollView {
                    TabView {
                        
                        ForEach(character.images, id: \.self) { imageURL in
                            AsyncImage(url: imageURL) { image in
                                
                                image.resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        .frame(width: geometry.size.width/1.2, height: geometry.size.height/1.7)
                        .clipShape(.rect(cornerRadius: 25))
                        .padding(.top, 60)
                    }
                    .tabViewStyle(.page)
                    .frame(width: geometry.size.width/1.2, height: geometry.size.height/1.7)
                    .clipShape(.rect(cornerRadius: 25))
                    .padding(.top, 60)
                    
                    VStack(alignment: .leading) {
                        Text(character.name)
                            .font(.largeTitle)
                        
                        Text("Potrayed By: \(character.portrayedBy)")
                            .font(.subheadline)
                        
                        Divider()
                        
                        Text("\(character.name) Character Info")
                            .font(.title2)
                        Text("Born: \(character.birthday)")
                        
                        Divider()
                        
                        Text("Occupations:")
                        ForEach(character.occupations, id: \.self) { occupation in
                            Text("•\(occupation)")
                                .font(.subheadline)
                        }
                        
                        Divider()
                        
                        Text("NickNames:")
                        if let aliases = character.aliases {
                            if !aliases.isEmpty {
                                ForEach(aliases, id: \.self) { alias in
                                    Text("•\(alias)")
                                        .font(.subheadline)
                                }
                            } else {
                                Text("None")
                                    .font(.subheadline)
                            }
                        }
                        
                        Divider()
                        
                        DisclosureGroup("Status (Spoiler Alert):") {
                            VStack(alignment: .leading) {
                                Text(character.status)
                                    .font(.title2)
                                
                                if let death = character.death {
                                    AsyncImage(url: death.image) { image in
                                        
                                        image.resizable()
                                            .scaledToFill()
                                            .clipShape(.rect(cornerRadius: 15))
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                    Text("How: \(death.details)")
                                    
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                           
                        }
                        .tint(.primary)
                        
                    }
                    .frame(width: geometry.size.width/1.25, alignment: .leading)
                    .padding(.bottom, 50)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    CharacterView(character: ViewModel().character, show: "Breaking Bad")
}
