//
//  NewReleasesResponse.swift
//  Mindify
//
//  Created by 김상진 on 2021/03/06.
//  Copyright © 2021 kipCalm. All rights reserved.
//

import Foundation

struct NewReleasesResponse: Codable {
    let albums: AlbumsResponse
}

struct AlbumsResponse: Codable {
    let items: [Album]
}

struct Album: Codable {
    let album_type: String
    let available_markets: [String]
    let id: String
    let images: [APIImage]
    let name: String
    let release_date: String
    let total_tracks: Int
    let artists: [Artist]
}

