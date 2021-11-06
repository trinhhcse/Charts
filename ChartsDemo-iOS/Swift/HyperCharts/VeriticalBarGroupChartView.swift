//
//  VeriticalBarGroupChartView.swift
//  ChartsDemo-iOS-Swift
//

import UIKit
import Charts

struct GroupChartItem {
    struct Part {
        var value: Double
        var color: UIColor
    }
    var title: String
    var parts: [Part]
}

class VeriticalBarGroupChartView: UIView {
    var chartView: BarChartView!
    var visual: StackBarChartVisual = StackBarChartVisual.defaultVisual
    private var numOfBar: Int = 3
    var chartItems: [StackBarChartItemData] = []
    var leftAxisUnit: String = ""

    // MARK: LifeCycle
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    private func customInit() {
        let width = CGFloat(visual.width * numOfBar + visual.space * (numOfBar - 1))
        chartView = BarChartView(frame: CGRect(x: 0, y: 0, width: width, height: 200))
        addSubview(chartView)
        
        setup(barLineChartView: chartView)
        
//        setDataCount(numOfBar, range: 50, highlight: 2)
        
    }
    
    func updateChartViewSize() {
        let groupSpace = 0.5
        let barSpace = 0.05
        let barWidth = 0.1
        // (0.3 + 0.05) * 2 + 0.3 = 1.00 -> interval per "group"
        var width = (barSpace + barWidth)
        width = width * Double(chartView.data?.dataSets.count ?? 0)
        width = width + groupSpace
        
        var frame = chartView.frame
        frame.size.width = CGFloat(width)
        chartView.frame = frame
    }

    func setup(barLineChartView chartView: BarChartView) {
        chartView.drawBarShadowEnabled = false
        chartView.drawValueAboveBarEnabled = true
        
        chartView.maxVisibleCount = 8

        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
//        xAxis.labelFont = .systemFont(ofSize: 10)
        xAxis.granularity = 1
//        xAxis.labelCount = 7
//        xAxis.valueFormatter = DayAxisValueFormatter(chart: chartView)
        xAxis.drawGridLinesEnabled = false
        xAxis.avoidFirstLastClippingEnabled = true
        
                
        let leftAxis = chartView.leftAxis
        leftAxis.labelFont = .systemFont(ofSize: 10)
        leftAxis.labelCount = 8
        leftAxis.valueFormatter = VerticalBarLeftAxisValueFormatter(unit: "襲")
        leftAxis.labelPosition = .outsideChart
        leftAxis.spaceTop = 0.15
        leftAxis.axisMinimum = 0 // FIXME: HUH?? this replaces startAtZero = YES
        leftAxis.axisLineColor = .clear
        
        let rightAxis = chartView.rightAxis
        rightAxis.enabled = false
        
        let l = chartView.legend
        l.horizontalAlignment = .center
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        l.form = .circle
        l.formSize = 9
        l.font = UIFont(name: "HelveticaNeue-Light", size: 11)!
        l.xEntrySpace = 4
    }

    func setData(titles: [String], colors: [UIColor], labels: [String], items: [[Double]]) {
        
        chartView.xAxis.valueFormatter = GroupBarValueFormatter(labels: titles)

        var listDataEntries: [[BarChartDataEntry]] = []
        
        items.forEach { values in
            var dataEntries: [BarChartDataEntry] = []
            for i in 0..<values.count {
                dataEntries.append(BarChartDataEntry(x: Double(i), y: values[i]))
            }
            listDataEntries.append(dataEntries)
            
        }

        var dataSets: [BarChartDataSet] = []
        for i in 0..<listDataEntries.count {
            let chartDataSet = BarChartDataSet(entries: listDataEntries[i], label: labels[i])
            chartDataSet.barCornerRadius = 4
            chartDataSet.colors = [colors[i]]
            chartDataSet.drawValuesEnabled = false
            dataSets.append(chartDataSet)
        }

        let chartData = BarChartData(dataSets: dataSets)


        let groupSpace = 0.5
        let barSpace = 0.05
        let barWidth = 0.1
        
        // (0.3 + 0.05) * 2 + 0.3 = 1.00 -> interval per "group"
//        let groupSpace = 24.0
//        let barSpace = 2.0
//        let barWidth = 8.0
//        // (0.3 + 0.05) * 2 + 0.3 = 1.00 -> interval per "group"

//        let width = (barSpace + barWidth) * Double(items.count) + groupSpace
        var frame = chartView.frame
        frame.size.width = CGFloat(60 * titles.count)
        chartView.frame = frame
        
        let groupCount = titles.count
        let startYear = 0

        chartData.barWidth = Double(barWidth);
        chartView.xAxis.axisMinimum = Double(startYear)
        let gg = chartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
        chartView.xAxis.axisMaximum = Double(startYear) + gg * Double(groupCount)

        chartData.groupBars(fromX: Double(startYear), groupSpace: groupSpace, barSpace: barSpace)
        //chartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
        chartView.notifyDataSetChanged()


        chartView.data = chartData

                
    }
}


class GroupBarValueFormatter: NSObject, ValueFormatter, AxisValueFormatter {
    var labels: [String]
    
    init(labels: [String]) {
        self.labels = labels
    }
    
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        if dataSetIndex < labels.count {
            return labels[dataSetIndex]
        }
        return ""
    }
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let index = Int(value)
        
        if index < labels.count {
            return labels[index]
        }
        return ""

    }
    
    
}
