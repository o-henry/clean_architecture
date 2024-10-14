//
//  ContentView.swift
//  CA
//
//  Created by Henry on 10/11/24.
//

import SwiftUI

struct ContentView: View {
    var adapter = MovieAPIAdapter()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            do {
                try await adapter.fetchNowPlayingMovies()
            } catch {}
        }
    }
}

#Preview {
    ContentView(adapter: MovieAPIAdapter())
}
