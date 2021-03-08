//
//  AuthResponse.swift
//  Mindify
//
//  Created by 김상진 on 2021/02/21.
//  Copyright © 2021 kipCalm. All rights reserved.
//

import Foundation

struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let scope: String
    let token_type: String
}
