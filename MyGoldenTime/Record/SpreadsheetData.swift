//
//  SpreadsheetData.swift
//  MyGoldenTime
//
//  Created by yeongwoocho on 2022/05/05.
//

import Foundation

struct SalesSpreadsheetData {
    var header: [[String]]
    var data: [[String]]
    
    init() {
        self.header = [["날짜", "7:00", "8:00", "9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00", "24:00"]]
        self.data = []
    }
    
    init(header: [[String]], total: [String], data: [[String]]) {
        self.header = header
        self.data = data
    }
}
