//
//  Line.swift
//  MyGoldenTime
//
//  Created by yeongwoocho on 2022/05/04.
//

import SwiftUI
import Charts

struct Line: UIViewRepresentable {
    var entries: [StateInfo] = []
    
    init() {
        (7...24).forEach { date in
            entries.append(StateInfo(date: "\(date)", hour: (7...24).randomElement()!, energy: (0...5).randomElement()!, consentration: (0...5).randomElement()!))
        }
    }
    
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
