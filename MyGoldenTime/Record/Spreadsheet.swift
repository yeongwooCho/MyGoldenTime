//
//  Spreadsheet.swift
//  MyGoldenTime
//
//  Created by yeongwoocho on 2022/05/05.
//

import SwiftUI
import UIKit
import SpreadsheetView

struct Spreadsheet: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = RecordViewController
    
    func makeUIViewController(context: Context) -> RecordViewController {
        return RecordViewController()
    }
    
    func updateUIViewController(_ uiViewController: RecordViewController, context: Context) {
        
    }
}
