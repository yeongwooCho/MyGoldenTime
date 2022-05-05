//
//  ChartsView.swift
//  MyGoldenTime
//
//  Created by yeongwoocho on 2022/05/03.
//

import SwiftUI
import Charts

struct ChartsView: View {
    
    var body: some View {
        VStack {
            Line()
                .frame(width: 300, height: 300)
        }
        .padding()
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
    }
}
