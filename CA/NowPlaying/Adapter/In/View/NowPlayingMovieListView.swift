//
//  NowPlayingMovieListView.swift
//  CA
//
//  Created by Henry on 10/14/24.
//

import SwiftUI

struct NowPlayingMovieListView: View {
    @StateObject var viewModel = NowPlayingMovieListViewModel()

    var body: some View {
        VStack {
            List(viewModel.movies, id: \.id) {
                Text($0.original_title)
            }
            .task {
                do {
                    try await viewModel.loadNowPlayingMovies()
                } catch {}
            }
        }
    }
}

#Preview {
    NowPlayingMovieListView()
}
