//
//  Error.swift
//  CA
//
//  Created by Henry on 10/14/24.
//

import Foundation

enum MOVIE_ERROR: Error {
    case NETWORK_ERROR(Error)
    case DECODING_ERROR
    case UNKNOWN_ERROR
    case NO_DATA_FOUND
}
