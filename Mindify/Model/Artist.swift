//
//  Artist.swift
//  Mindify
//
//  Created by 김상진 on 2021/02/18.
//  Copyright © 2021 kipCalm. All rights reserved.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let external_urls: [String: String]
}
