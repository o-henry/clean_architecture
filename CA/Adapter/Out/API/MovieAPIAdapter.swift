//
//  MovieAPIAdapter.swift
//  CA
//
//  Created by Henry on 10/13/24.
//

import Foundation

class MovieAPIAdapter {
    func fetch() async throws {
        guard let api_key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { return }

        // URL 요청 생성
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1")!)

        // 요청 헤더에 Authorization, Content-Type  추가
        request.addValue("Bearer \(api_key)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        // URLSession을 사용하여 데이터 요청
        let (data, _) = try await URLSession.shared.data(for: request)

        // 데이터를 디코딩하여 Movie 배열 생성
        guard let decoded = try? JSONDecoder().decode(MovieResponse.self, from: data) else { return }
        print("최신 영화 데이터 : \(decoded.results)")
    }
}

struct MovieResponse: Decodable {
    let results: [Movie]
    let dates: Dates?
    let page: Int
    let total_results: Int
    let total_pages: Int

    struct Dates: Decodable {
        let maximum: String
        let minimum: String
    }
}

struct Movie: Decodable {
    let id: Int // JSON에서는 id가 Int로 되어 있습니다.
    let release_date: String
    let popularity: Double
    let original_title: String
    let adult: Bool
}
