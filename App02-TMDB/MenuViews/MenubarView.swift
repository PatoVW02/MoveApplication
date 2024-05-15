//
//  MenubarView.swift
//  App02-TMDB
//
//  Created by Patricio Villarreal Welsh on 23/08/23.
//

import SwiftUI

struct MenubarView: View {
    @Binding var selectedView: String?
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    selectedView = "home"
                }) {
                    VStack {
                        Image(systemName: "house.fill")
                            .foregroundColor(Color.black)
                        Text("Home")
                            .foregroundColor(Color.black)
                    }
                }
                .frame(maxWidth: .infinity)
                
                Button(action: {
                    selectedView = "search"
                }) {
                    VStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.black)
                        Text("Search")
                            .foregroundColor(Color.black)
                    }
                }
                .frame(maxWidth: .infinity)
                
                Button(action: {
                    selectedView = "favorites"
                }) {
                    VStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.black)
                        Text("Favorites")
                            .foregroundColor(Color.black)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.top, 20)
        .background(Color.gray.opacity(0.2))
    }
}

struct MenubarView_Previews: PreviewProvider {
    static var previews: some View {
        MenubarView(selectedView: .constant("home"))
    }
}
