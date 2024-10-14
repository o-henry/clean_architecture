//
//  FindNowPlayingUseCase.swift
//  CA
//
//  Created by Henry on 10/14/24.
//

import Foundation

/// ① "최신 영화 정보 확인" 유스케이스
protocol FindNowPlayingMovieUseCase {
    func execute() async -> Result<[Movie], MOVIE_ERROR>
}
