//
//  VerticalBarChart.swift
//  Hyperloung
//

import UIKit
import Charts

struct ChartVisual {
    var space: Int
    var width: Int
    var bottomTitleSpace: CGFloat = 10

    static var defaultVisual: ChartVisual {
        return ChartVisual(space: 50, width: 8)
    }
}

struct ChartItemData {
    var title: String
    var valueTitle: String
    var value: Double
    var isHighlight: Bool = false

    var barVisual: BarVisual
}

struct BarVisual {
    var radius: Double
    var normalColor: UIColor
    var highlightColor: UIColor
    var normalTextColor: UIColor
    var highlightTextColor: UIColor
    var isHighlight: Bool = false
    
    static func defaultVisual() -> BarVisual {
        return BarVisual(radius: 4.0, normalColor: #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1), highlightColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), normalTextColor: #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1), highlightTextColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    }
}

class VeritalBarChartView: UIView {
    // MARK: Properties
    var chartView: BarChartView!
    var visual: ChartVisual = ChartVisual.defaultVisual
    private var numOfBar: Int = 4
    var chartItems: [ChartItemData] = []
    
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
        
        setDataCount(numOfBar, range: 50, highlight: 2)
        
        var limitLine = ChartLimitLine()
        limitLine = ChartLimitLine(limit: 45.5, label: "15")
        limitLine.lineColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        limitLine.valueTextColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        limitLine.lineDashLengths = [3.0]
        chartView.leftAxis.addLimitLine(limitLine)

    }
    
    func showChartItems(items: [ChartItemData]) {
        let yVals: [BarChartDataEntry] = items.map { item in
            let data = BarChartDataEntry(x: item.value, y: item.value, data: item.barVisual)
            return data
        }
        
        var set1: HyperChartBaseDataSet = HyperChartBaseDataSet(entries: yVals, label: "label ")
        set1.barCornerRadius = 4
        set1.colors = [.black, .white] // array always have more than 1 item so "color(atIndex index: Int)" to be called
        set1.drawValuesEnabled = true
//        set1.valueFormatter = VerticalBarValueFormatter(titles: bottomLabels)
        let data = BarChartData(dataSet: set1)
        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10)!)
        data.setValueTextColor( .black)
        data.barWidth = calculateBarWidth()

    }
    
    // MARK: Functions
    /*
     Because BarChartView will calculate the with of bar by percentage,
     It will calculate by with and number of item
     But our design persist  with and space so the with of BarChartView will change by number of view and visual
     **/
    func setNumOfBar(num: Int) {
        
    }
    
    func setup(barLineChartView chartView: BarLineChartViewBase) {
        chartView.chartDescription.enabled = false
        
        chartView.dragEnabled = false
        chartView.setScaleEnabled(false)
        chartView.pinchZoomEnabled = false

        
        // ChartYAxis *leftAxis = chartView.leftAxis;
        chartView.xAxis.wordWrapEnabled = true
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.rightAxis.enabled = false
        chartView.leftAxis.enabled = true
        chartView.leftAxis.drawLabelsEnabled = false // Hide label
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.legend.enabled = false

        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelTextColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        
        var titles: [String] = []
        for _ in 0..<numOfBar {
            titles.append("날짜")
        }
        
        var colors: [UIColor] = []
        for _ in 0..<numOfBar {
            colors.append(UIColor.green)
        }


        chartView.xAxis.yOffset = visual.bottomTitleSpace // spacing bottom  bar title - bar rect
        
        // set bottom item titles
        chartView.xAxis.valueFormatter = VerticalBarValueFormatter(titles: titles, colors: colors)
        chartView.xAxis.setLabelCount(numOfBar, force: false)
//        chartView.highlightValues([Highlight(x: 2, dataSetIndex: 1, stackIndex: 0)])
        
    }
    
    func setDataCount(_ count: Int, range: UInt32, highlight: Int) {
        let yVals = (0..<count).map { (i) -> BarChartDataEntry in
            let val = Double(46.0)
            var barVisual = BarVisual.defaultVisual()
            barVisual.isHighlight = i == 1
            let data = BarChartDataEntry(x: Double(i), y: val, data: barVisual)
            return data
        }
        
        var bottomLabels: [String] = []
        for _ in 0..<numOfBar {
            bottomLabels.append("같은데")
        }

        
        var set1: HyperChartBaseDataSet = HyperChartBaseDataSet(entries: yVals, label: "label ")
        set1.barCornerRadius = 4
        set1.colors = [.black, .white] // array always have more than 1 item so "color(atIndex index: Int)" to be called
        set1.drawValuesEnabled = true
//        set1.valueFormatter = VerticalBarValueFormatter(titles: bottomLabels)
        let data = BarChartData(dataSet: set1)
        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10)!)
        data.setValueTextColor( .black)
        data.barWidth = calculateBarWidth()
        
        chartView.data = data
        
    }
    
    func calculateBarWidth() -> Double {
        let width = CGFloat(visual.width * numOfBar + visual.space * (numOfBar - 1))
        return Double(visual.width * numOfBar) / Double(width)
    }
    
}

class HyperChartBaseDataSet: BarChartDataSet {
    override init(entries: [ChartDataEntry], label: String) {
        super.init(entries: entries, label: label)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    // body Bar color
    override func color(atIndex index: Int) -> NSUIColor {
        let entry = entries[index]
        if let visual = entry.data as? BarVisual {
            return visual.isHighlight ? visual.highlightColor : visual.normalColor
        }
        return UIColor.red
    }
    
    // value title color on top of each bar
    override func valueTextColorAt(_ index: Int) -> NSUIColor {
        let entry = entries[index]
        if let visual = entry.data as? BarVisual {
            return visual.isHighlight ? visual.highlightTextColor : visual.normalTextColor
        }
        
        return UIColor.red
    }
}

public class VerticalBarValueFormatter: NSObject, ValueFormatter, AxisValueFormatter {
    var titles: [String] = []
    var colors: [UIColor] = []
    
    init(titles: [String], colors: [UIColor] = []) {
        self.titles = titles
        self.colors = colors
    }
    
    fileprivate func format(value: Double) -> String {
        let index = Int(value)
        if index < titles.count {
            return titles[index]
        }
        return ""
    }
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return format(value: value)
    }
    
    public func stringForValue(
        _ value: Double,
        entry: ChartDataEntry,
        dataSetIndex: Int,
        viewPortHandler: ViewPortHandler?) -> String {
        if dataSetIndex < titles.count {
            return titles[dataSetIndex]
        }
        return ""
    }
    
    public func colorForValue(_ value: Double, axis: AxisBase?) -> UIColor? {
        let index = Int(value)
        if colors.count > index {
            return colors[index]
        }
        return nil
    }
}
