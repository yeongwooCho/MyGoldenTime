//
//  RecordView.swift
//  MyGoldenTime
//
//  Created by yeongwoocho on 2022/05/05.
//

import SwiftUI

struct RecordView: View {
    var body: some View {
        VStack {
            HStack {
                Text("기록")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            } // HStack
            .padding(20)
            Spreadsheet()
        }
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
