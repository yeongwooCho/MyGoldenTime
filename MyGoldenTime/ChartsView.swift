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
        GeometryReader { proxy in
            ScrollView {
                HStack {
                    Text("차트")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                } // HStack
                .padding(20)
                
                VStack(alignment: .center, spacing: 10) {
                    HStack {
                        Text("일주일 상태")
                            .fontWeight(.bold)
                        Spacer()
                    } // HStack
                    Line()
                } // VStack
                .padding(10)
                .frame(width: proxy.size.width - 40, height: 300)
                .background()
                .cornerRadius(20)
                .shadow(color: .gray, radius: 10, x: 5, y: 5)
                .padding(.bottom, 10)
                
                VStack(alignment: .center, spacing: 10) {
                    HStack {
                        Text("한달 상태")
                            .fontWeight(.bold)
                        Spacer()
                    } // HStack
                    Line()
                } // VStack
                .padding(10)
                .frame(width: proxy.size.width - 40, height: 300)
                .background()
                .cornerRadius(20)
                .shadow(color: .gray, radius: 10, x: 5, y: 5)
                .padding(.bottom, 10)
                
                VStack(alignment: .center, spacing: 10) {
                    HStack {
                        Text("최종 누적 상태")
                            .fontWeight(.bold)
                        Spacer()
                    } // HStack
                    Line()
                } // VStack
                .padding(10)
                .frame(width: proxy.size.width - 40, height: 300)
                .background()
                .cornerRadius(20)
                .shadow(color: .gray, radius: 10, x: 5, y: 5)
                .padding(.bottom, 10)
            } // ScrollView
        } // GeometryReader
    } // body
}


struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
    }
}
