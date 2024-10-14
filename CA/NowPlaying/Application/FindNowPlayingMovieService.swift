//
//  FindNowPlayingMovieService.swift
//  CA
//
//  Created by Henry on 10/14/24.
//

import Foundation

struct FindNowPlayingMovieService: FindNowPlayingMovieUseCase {
    private let findNowPlayingPort: FindNowPlayingPort

    init(findNowPlayingPort: FindNowPlayingPort = MovieAPIAdapter()) {
        self.findNowPlayingPort = findNowPlayingPort
    }

    func execute() async -> Result<[Movie], MOVIE_ERROR> {
        return await findNowPlayingPort.fetchNowPlayingMovies()
    }
}
