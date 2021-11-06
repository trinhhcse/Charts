//
//  BarChartViewController.swift
//  ChartsDemo-iOS
//
//  Created by Jacob Christie on 2017-07-09.
//  Copyright © 2017 jc. All rights reserved.
//

#if canImport(UIKit)
    import UIKit
#endif
import Charts
#if canImport(UIKit)
    import UIKit
#endif

class BarChartViewController: DemoBaseViewController {
    
    @IBOutlet var chartView: BarChartView!
    @IBOutlet var sliderX: UISlider!
    @IBOutlet var sliderY: UISlider!
    @IBOutlet var sliderTextX: UITextField!
    @IBOutlet var sliderTextY: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Bar Chart"
        
        self.options = [.toggleValues,
                        .toggleHighlight,
                        .animateX,
                        .animateY,
                        .animateXY,
                        .saveToGallery,
                        .togglePinchZoom,
                        .toggleData,
                        .toggleBarBorders]
        
        self.setup(barLineChartView: chartView)
        
        chartView.delegate = self
        
        chartView.drawBarShadowEnabled = false
        chartView.drawValueAboveBarEnabled = true
        
        chartView.maxVisibleCount = 60
        chartView.legend.horizontalAlignment = .left

        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 10)
        xAxis.granularity = 1
        xAxis.labelCount = 7
        xAxis.valueFormatter = DayAxisValueFormatter(chart: chartView)
        xAxis.drawGridLinesEnabled = false
        
        let leftAxisFormatter = NumberFormatter()
        leftAxisFormatter.minimumFractionDigits = 0
        leftAxisFormatter.maximumFractionDigits = 1
        leftAxisFormatter.negativeSuffix = " $"
        leftAxisFormatter.positiveSuffix = " $"
        
        let leftAxis = chartView.leftAxis
        leftAxis.labelFont = .systemFont(ofSize: 10)
        leftAxis.labelCount = 8
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: leftAxisFormatter)
        leftAxis.labelPosition = .outsideChart
        leftAxis.spaceTop = 0.15
        leftAxis.axisMinimum = 0 // FIXME: HUH?? this replaces startAtZero = YES
        leftAxis.axisLineColor = .clear
        
        let rightAxis = chartView.rightAxis
        rightAxis.enabled = false
        rightAxis.labelFont = .systemFont(ofSize: 10)
        rightAxis.labelCount = 8
        rightAxis.valueFormatter = leftAxis.valueFormatter
        rightAxis.spaceTop = 0.15
        rightAxis.axisMinimum = 0
        
        let l = chartView.legend
        l.horizontalAlignment = .left
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        l.form = .circle
        l.formSize = 9
        l.font = UIFont(name: "HelveticaNeue-Light", size: 11)!
        l.xEntrySpace = 4
//        chartView.legend = l

        let marker = XYMarkerView(color: UIColor(white: 180/250, alpha: 1),
                                  font: .systemFont(ofSize: 12),
                                  textColor: .white,
                                  insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8),
                                  xAxisValueFormatter: chartView.xAxis.valueFormatter!)
        marker.chartView = chartView
        marker.minimumSize = CGSize(width: 80, height: 40)
        chartView.marker = marker
        
        sliderX.value = 12
        sliderY.value = 50
        slidersValueChanged(nil)
    }
    
    override func updateChartData() {
        if self.shouldHideData {
            chartView.data = nil
            return
        }
        
        self.setDataCount(Int(sliderX.value) + 1, range: UInt32(sliderY.value))
    }
    
    func setDataCount(_ count: Int, range: UInt32) {
        addGroup()
        
//        let start = 1
//
//        let yVals = (start..<start+count+1).map { (i) -> BarChartDataEntry in
//            let mult = range + 1
//            let val = Double(arc4random_uniform(mult))
//            if arc4random_uniform(100) < 25 {
//                return BarChartDataEntry(x: Double(i), y: val, icon: UIImage(named: "icon"))
//            } else {
//                return BarChartDataEntry(x: Double(i), y: val)
//            }
//        }
//
//        var set1: BarChartDataSet! = nil
//        if let set = chartView.data?.first as? BarChartDataSet {
//            set1 = set
//            set1.replaceEntries(yVals)
//            chartView.data?.notifyDataChanged()
//            chartView.notifyDataSetChanged()
//        } else {
//            set1 = BarChartDataSet(entries: yVals, label: "The year 2017")
//            set1.colors = ChartColorTemplates.material()
//            set1.drawValuesEnabled = false
//
//            let data = BarChartData(dataSet: set1)
//            data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10)!)
//            data.barWidth = 0.9
//            chartView.data = data
//        }
//
////        chartView.setNeedsDisplay()
        
    }


    let months = ["Jan", "Feb", "Mar", "Apr", "May"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0]
        let unitsBought = [10.0, 14.0, 60.0, 13.0, 2.0]

    func addGroup() {
        chartView.noDataText = "You need to provide data for the chart."
        var dataEntries: [BarChartDataEntry] = []
        var dataEntries1: [BarChartDataEntry] = []
        
        for i in 0..<self.months.count {
            
            let dataEntry = BarChartDataEntry(x: Double(i) , y: self.unitsSold[i])
            dataEntries.append(dataEntry)
            
            let dataEntry1 = BarChartDataEntry(x: Double(i) , y: self.self.unitsBought[i])
            dataEntries1.append(dataEntry1)
            
            //stack barchart
            //let dataEntry = BarChartDataEntry(x: Double(i), yValues:  [self.unitsSold[i],self.unitsBought[i]], label: "groupChart")
            
            
            
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Unit sold")
        let chartDataSet1 = BarChartDataSet(entries: dataEntries1, label: "Unit Bought")
        
        let dataSets: [BarChartDataSet] = [chartDataSet,chartDataSet1]
        chartDataSet.colors = [UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)]
        chartDataSet1.colors = [.red]

        //chartDataSet.colors = ChartColorTemplates.colorful()
        //let chartData = BarChartData(dataSet: chartDataSet)
        
        let chartData = BarChartData(dataSets: dataSets)
        
        
        let groupSpace = 0.3
        let barSpace = 0.05
        let barWidth = 0.3
        // (0.3 + 0.05) * 2 + 0.3 = 1.00 -> interval per "group"
        
        let groupCount = self.months.count
        let startYear = 0
        
        
        chartData.barWidth = barWidth;
        chartView.xAxis.axisMinimum = Double(startYear)
        let gg = chartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
        print("Groupspace: \(gg)")
        chartView.xAxis.axisMaximum = Double(startYear) + gg * Double(groupCount)
        
        chartData.groupBars(fromX: Double(startYear), groupSpace: groupSpace, barSpace: barSpace)
        //chartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
        chartView.notifyDataSetChanged()
        
        chartView.data = chartData
        
        
        
        
        
        
        //background color
        chartView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        
        //chart animation
        chartView.animate(xAxisDuration: 1.5, yAxisDuration: 1.5, easingOption: .linear)
    }
    
    override func optionTapped(_ option: Option) {
        super.handleOption(option, forChartView: chartView)
    }
    
    // MARK: - Actions
    @IBAction func slidersValueChanged(_ sender: Any?) {
        sliderTextX.text = "\(Int(sliderX.value + 2))"
        sliderTextY.text = "\(Int(sliderY.value))"
        
        self.updateChartData()
    }
}
