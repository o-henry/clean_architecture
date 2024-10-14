//
//  Movie.swift
//  CA
//
//  Created by Henry on 10/14/24.
//

import Foundation

struct Movie: Decodable {
    let id: Int // JSON에서는 id가 Int로 되어 있습니다.
    let release_date: String
    let popularity: Double
    let original_title: String
    let adult: Bool
}

struct MovieResponse: Decodable {
    let results: [Movie]
    let dates: Dates
    let page: Int
    let total_results: Int
    let total_pages: Int

    struct Dates: Decodable {
        let maximum: String
        let minimum: String
    }
}
