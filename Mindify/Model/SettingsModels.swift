//
//  SettingsModels.swift
//  Mindify
//
//  Created by 김상진 on 2021/03/04.
//  Copyright © 2021 kipCalm. All rights reserved.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
