//
//  File.swift
//  MyGoldenTime
//
//  Created by yeongwoocho on 2022/05/04.
//

import Foundation

struct StateInfo: Codable {
    var shortDate: String // dd-MM hh ??
    var longDate: String // yyyy-dd-MM hh ??
    var what: String?
    var why: String?
    var energy: Int
    var consentration: Int
}


