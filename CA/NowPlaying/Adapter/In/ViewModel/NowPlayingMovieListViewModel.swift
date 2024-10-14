//
//  NowPlayingMovieListViewModel.swift
//  CA
//
//  Created by Henry on 10/14/24.
//

import Foundation

@MainActor
class NowPlayingMovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var error_message: String? = ""

    private let findNowPlayingUseCase: FindNowPlayingMovieUseCase

    init(findNowPlayingUseCase: FindNowPlayingMovieUseCase = FindNowPlayingMovieService()) {
        self.findNowPlayingUseCase = findNowPlayingUseCase
    }

    func loadNowPlayingMovies() {
        Task {
            let result = await findNowPlayingUseCase.execute()
            switch result {
            case .success(let movies):
                self.movies = movies
            case .failure(let error):
                self.error_message = error.localizedDescription
            }
        }
    }
}
