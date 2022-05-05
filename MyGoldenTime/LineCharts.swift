//
//  LineCharts.swift
//  MyGoldenTime
//
//  Created by yeongwoocho on 2022/05/04.
//

import Charts

extension LineChartView {

    private class LineChartFormatter: NSObject, AxisValueFormatter {
        
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
    func setupLineChartsView(stateInfos: [StateInfo]) {
        if !stateInfos.isEmpty {
            let labels = stateInfos.map { ($0.date) }
            let energyValues = stateInfos.map { Double($0.energy) }
            let consentrationValues = stateInfos.map { Double($0.consentration) }

            let energyData = self.getLineChartData(yValues: energyValues, label: "에너지 상태", lineColor: UIColor.red)
            let consentrationData = self.getLineChartData(yValues: consentrationValues, label: "집중력 상태", lineColor: UIColor.blue)
            self.setLineChart(xValues: labels, chartDataSets: [energyData, consentrationData])
        } else {
            self.noDataText = "에너지 데이터가 존재하지 않습니다."
            self.data = .none
        }
        self.reloadInputViews()
    }
}
