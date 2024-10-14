//
//  FindNowPlayingPort.swift
//  CA
//
//  Created by Henry on 10/14/24.
//

import Foundation

/// ① 아웃바운드 어댑터(API 서버) 로부터 현재 상영중인 영화 정보 요청
protocol FindNowPlayingPort {
    func fetchNowPlayingMovies() async -> Result<[Movie], MOVIE_ERROR>
}
