//
//  AudioTrack.swift
//  Mindify
//
//  Created by 김상진 on 2021/02/18.
//  Copyright © 2021 kipCalm. All rights reserved.
//

import Foundation

struct AudioTrack: Codable {
    let album: Album
    let artists: [Artist]
    let available_markets: [String]
    let disc_number: Int
    let duration_ms: Int
    let explicit: Bool
    let external_urls: [String: String]
    let id: String
    let name: String
    let popularity: Int
}
