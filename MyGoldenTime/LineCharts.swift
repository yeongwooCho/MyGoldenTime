//
//  LineCharts.swift
//  MyGoldenTime
//
//  Created by yeongwoocho on 2022/05/04.
//

import SwiftUI
import Charts

extension LineChartView {

    private class LineChartFormatter: NSObject, IAxisValueFormatter {
        
        var labels: [String] = []
        
        init(labels: [String]) {
            super.init()
            self.labels = labels
        }
        
        func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            let indexTimeInterval: Int = Int(value)
            if self.labels.count <= indexTimeInterval || indexTimeInterval < 0 { return "--" }
            return self.labels[indexTimeInterval]
        }
    }
    
    private func configurationLineChart() {
        self.xAxis.granularity = 1
        self.leftAxis.granularity = 1
        self.leftAxis.axisMinimum = 0
        self.rightAxis.enabled = false
        self.pinchZoomEnabled = false
        self.doubleTapToZoomEnabled = false
        self.animate(xAxisDuration: 0.5, yAxisDuration: 0.5)
    }
    
    private func getLineChartData(yValues: [Double], label: String, lineColor: UIColor) -> LineChartDataSet {
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<yValues.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: yValues[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: label)
        chartDataSet.setColor(lineColor)
        chartDataSet.setCircleColor(lineColor)
        chartDataSet.circleRadius = 5
        chartDataSet.drawCircleHoleEnabled = false
        
        return chartDataSet
    }
    
    private func setLineChart(xValues: [String], chartDataSets: [LineChartDataSet]) {
        // x axis
        let chartData = LineChartData(dataSets: chartDataSets)
        let chartFormatter = LineChartFormatter(labels: xValues)
        let xAxis = XAxis()
        xAxis.valueFormatter = chartFormatter
        self.xAxis.valueFormatter = xAxis.valueFormatter
        
        // value
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        chartData.setValueFormatter(formatter)
        
        self.configurationLineChart()
        self.data = chartData
    }
}

extension LineChartView {
    func setupLineChartsView(inputData: [String: Double]) {
        if !inputData.isEmpty {
//            let labels = orderCount.map { ($0.order_date) }
//            let totalValues = orderCount.map { Double($0.order_count) }
//            let validValues = orderCount.map { Double($0.order_valid_count) }
            
            let labels = inputData.map { ($0.key) }
            let values = inputData.map { Double($0.value) }

            let data = self.getLineChartData(yValues: values, label: "에너지", lineColor: UIColor.red)
            self.setLineChart(xValues: labels, chartDataSets: [data])
            
//            let totalData = self.getLineChartData(yValues: totalValues, label: "전체 오더 수", lineColor: UIColor.ocRed7)
//            let validData = self.getLineChartData(yValues: validValues, label: "유효 오더 수", lineColor: UIColor.ocYellow7)
//            self.setLineChart(xValues: labels, chartDataSets: [validData, totalData])
            
        } else {
            self.noDataText = "에너지 데이터가 존재하지 않습니다."
            self.data = .none
        }
        self.reloadInputViews()
    }
}
