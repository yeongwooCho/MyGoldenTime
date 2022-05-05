//
//  Line.swift
//  MyGoldenTime
//
//  Created by yeongwoocho on 2022/05/04.
//

import SwiftUI
import Charts

struct Line: UIViewRepresentable {
    //Bar chart accepts data as array of BarChartDataEntry objects
//    var entries : [LineChartDataEntry]
//    var entries: [ChartDataEntry]
    
    // this func is required to conform to UIViewRepresentable protocol
    func makeUIView(context: Context) -> LineChartView {
        //crate new chart
        let chart = LineChartView()
        //it is convenient to form chart data in a separate func
//        chart.setupLineChartsView(inputData: ["12":123])
        chart.setupLineChartsView(stateInfos: [StateInfo(shortDate: "123", longDate: "12341234", energy: 5, consentration: 3)])
        
//        chart.data = addData()
        return chart
    }
    
    // this func is required to conform to UIViewRepresentable protocol
    func updateUIView(_ uiView: LineChartView, context: Context) {
        //when data changes chartd.data update is required
//        uiView.data = addData()
    }
    
    func addData() -> LineChartData{
        let data = LineChartData()
//        //BarChartDataSet is an object that contains information about your data, styling and more
//        let dataSet = LineChartDataSet(entries: entries)
//
//        // change bars color to green
////        dataSet.colors = [NSUIColor.green]
//        //change data label
//        dataSet.label = "My Data"
//        data.addDataSet(dataSet)
        return data
    }
    
    func configrationLineChart() {
        
    }
    
    typealias UIViewType = LineChartView
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
//        Line(entries: [
//            //x - position of a bar, y - height of a bar
//            ChartDataEntry(x: 1, y: 1),
//            ChartDataEntry(x: 2, y: 1),
//            ChartDataEntry(x: 3, y: 1),
//            ChartDataEntry(x: 4, y: 1),
//            ChartDataEntry(x: 5, y: 1)
//
//        ])
        Line()
    }
}
