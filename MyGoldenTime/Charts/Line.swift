//
//  Line.swift
//  MyGoldenTime
//
//  Created by yeongwoocho on 2022/05/04.
//

import SwiftUI
import Charts

struct Line: UIViewRepresentable {
    var entries: [StateInfo] = [
        StateInfo(date: "1", hour: 13, energy: 1, consentration: 3),
        StateInfo(date: "3", hour: 15, energy: 3, consentration: 2),
        StateInfo(date: "5", hour: 12, energy: 2, consentration: 1),
        StateInfo(date: "7", hour: 10, energy: 5, consentration: 5),
        StateInfo(date: "9", hour: 8, energy: 5, consentration: 4),
        StateInfo(date: "11", hour: 7, energy: 4, consentration: 5),
        StateInfo(date: "13", hour: 6, energy: 2, consentration: 5),
        
    ]
    
    func makeUIView(context: Context) -> LineChartView {
        let chart = LineChartView()
        chart.setupLineChartsView(stateInfos: entries)
        return chart
    }
    
    func updateUIView(_ uiView: LineChartView, context: Context) { }
    
    func addData() -> LineChartData{
        let data = LineChartData()
        return data
    }
    
    typealias UIViewType = LineChartView
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        Line()
    }
}
