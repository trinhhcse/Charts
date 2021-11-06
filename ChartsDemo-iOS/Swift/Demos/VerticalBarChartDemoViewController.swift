//
//  VerticalBarChartDemoViewController.swift
//  ChartsDemo-iOS-Swift
//
//  Created by dongha on 04/11/2021.
//  Copyright © 2021 dcg. All rights reserved.
//

import UIKit
import Charts

class VerticalBarChartDemoViewController: UIViewController {
    @IBOutlet weak var sampleStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addChartView_aos_d_bar_04()
        addChartView_aos_d_bar_01()
        addChartView_aos_d_bar_02()
        addChartView_aos_d_bar_03()
        addChartView_aos_d_bar_06()
        addChartView_aos_d_bar_07()
    }
    
    
    func addChartView_aos_d_bar_01() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
        titleLabel.text = "Demo: aos_d_bar_01"
        sampleStackView.addArrangedSubview(titleLabel)
        titleLabel.addHeightConstraint(value: 30)
        
        let barChartView = VeritalBarChartView(frame: CGRect(x: 50, y: 60, width: 400, height: 300))
        barChartView.clipsToBounds = false
        sampleStackView.addArrangedSubview(barChartView)
        barChartView.addHeightConstraint(value: 200)
        sampleStackView.layoutIfNeeded()
        
        barChartView.chartView.leftAxis.enabled = false
        
        let chartVisual: ChartVisual = ChartVisual(space: 50, width: 8, bottomTitleSpace: 0)
        barChartView.setChartVisual(chartVisual)
        
        var chartItems: [BarChartItemData] = []
        let barVisual: BarVisual = BarVisual(radius: 4, normalColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), highlightColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), normalTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), highlightTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        chartItems.append(BarChartItemData(title: "10울산", valueTitle: "5공식", value: 2.3, barVisual: barVisual))
        chartItems.append(BarChartItemData(title: "8울산", valueTitle: "15공식", value: 30.0, isHighlight: true, barVisual: barVisual))
        chartItems.append(BarChartItemData(title: "6울산", valueTitle: "45공식", value: 30.0, barVisual: barVisual))
        chartItems.append(BarChartItemData(title: "9울산", valueTitle: "75공식", value: 46.0, barVisual: barVisual))

        barChartView.setChartItems(items: chartItems)
    }
    
    func addChartView_aos_d_bar_02() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
        titleLabel.text = "Demo: aos_d_bar_02"
        sampleStackView.addArrangedSubview(titleLabel)
        titleLabel.addHeightConstraint(value: 30)
        
        let barChartView = VeritalBarChartView(frame: CGRect(x: 50, y: 60, width: 400, height: 300))
        barChartView.clipsToBounds = false
        sampleStackView.addArrangedSubview(barChartView)
        barChartView.addHeightConstraint(value: 200)
        sampleStackView.layoutIfNeeded()
        
        barChartView.chartView.leftAxis.enabled = false
        barChartView.addLimitLine(value: 26.0, title: "limit line")
        
        let chartVisual: ChartVisual = ChartVisual(space: 50, width: 8, bottomTitleSpace: 0)
        barChartView.setChartVisual(chartVisual)
        
        var chartItems: [BarChartItemData] = []
        let barVisual: BarVisual = BarVisual(radius: 4, normalColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), highlightColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), normalTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), highlightTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        chartItems.append(BarChartItemData(title: "10울산", valueTitle: "5공식", value: 2.3, barVisual: barVisual))
        chartItems.append(BarChartItemData(title: "8울산", valueTitle: "15공식", value: 30.0, isHighlight: true, barVisual: barVisual))
        chartItems.append(BarChartItemData(title: "6울산", valueTitle: "45공식", value: 30.0, barVisual: barVisual))
        chartItems.append(BarChartItemData(title: "9울산", valueTitle: "75공식", value: 46.0, barVisual: barVisual))

        barChartView.setChartItems(items: chartItems)
    }

    func addChartView_aos_d_bar_03() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
        titleLabel.text = "Demo: aos_d_bar_03"
        sampleStackView.addArrangedSubview(titleLabel)
        titleLabel.addHeightConstraint(value: 30)
        
        let barChartView = VeritalBarChartView(frame: CGRect(x: 50, y: 60, width: 400, height: 300))
        barChartView.clipsToBounds = false
        sampleStackView.addArrangedSubview(barChartView)
//        view.addSubview(barChartView)
        barChartView.addHeightConstraint(value: 200)
        sampleStackView.layoutIfNeeded()
        
        barChartView.chartView.leftAxis.enabled = false
        
        let chartVisual: ChartVisual = ChartVisual(space: 50, width: 8, bottomTitleSpace: 0)
        barChartView.setChartVisual(chartVisual)
        
        var chartItems: [BarChartItemData] = []
        let barVisual: BarVisual = BarVisual(radius: 4, normalColor: #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1), highlightColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), normalTextColor: #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1), highlightTextColor: #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1))
        chartItems.append(BarChartItemData(title: "10울산", valueTitle: "5공식", value: 2.3, barVisual: barVisual))
        chartItems.append(BarChartItemData(title: "8울산", valueTitle: "15공식", value: 30.0, isHighlight: true, barVisual: barVisual))
        chartItems.append(BarChartItemData(title: "6울산", valueTitle: "45공식", value: 30.0, barVisual: barVisual))
        chartItems.append(BarChartItemData(title: "9울산", valueTitle: "75공식", value: 46.0, barVisual: barVisual))

        barChartView.setChartItems(items: chartItems)
    }
    
    
    func addChartView_aos_d_bar_06() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
        titleLabel.text = "Demo: aos_d_bar_06"
        sampleStackView.addArrangedSubview(titleLabel)
        titleLabel.addHeightConstraint(value: 30)
        
        let barChartView = VeritalBarChartView(frame: CGRect(x: 50, y: 60, width: 400, height: 300))
        barChartView.clipsToBounds = false
        sampleStackView.addArrangedSubview(barChartView)
        barChartView.addHeightConstraint(value: 200)
        sampleStackView.layoutIfNeeded()
        
        barChartView.leftAxisUnit = "역"
        barChartView.chartView.leftAxis.enabled = true
        barChartView.chartView.leftAxis.drawLabelsEnabled = true
        barChartView.chartView.leftAxis.gridColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        
        let chartVisual: ChartVisual = ChartVisual(space: 50, width: 8, bottomTitleSpace: 0)
        barChartView.setChartVisual(chartVisual)
        
        var chartItems: [BarChartItemData] = []
        let barVisual: BarVisual = BarVisual(radius: 4, normalColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), highlightColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), normalTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), highlightTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        chartItems.append(BarChartItemData(title: "10울산", valueTitle: "5공식", value: 2.3, barVisual: barVisual))
        chartItems.append(BarChartItemData(title: "8울산", valueTitle: "15공식", value: 30.0, isHighlight: true, barVisual: barVisual))
        chartItems.append(BarChartItemData(title: "6울산", valueTitle: "45공식", value: 30.0, barVisual: barVisual))
        chartItems.append(BarChartItemData(title: "9울산", valueTitle: "75공식", value: 46.0, barVisual: barVisual))

        barChartView.setChartItems(items: chartItems)
    }
    
    func addChartView_aos_d_bar_07() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
        titleLabel.text = "Demo: aos_d_bar_07"
        sampleStackView.addArrangedSubview(titleLabel)
        titleLabel.addHeightConstraint(value: 30)

        let veriticalBarGroupChartView: VeriticalBarGroupChartView = VeriticalBarGroupChartView()
        sampleStackView.addArrangedSubview(veriticalBarGroupChartView)
        
                let months = ["Jan", "Feb", "Mar"]
                let unitsSold = [20.0, 4.0, 6.0]
                let unitsBought = [10.0, 14.0, 60.0]
        
        veriticalBarGroupChartView.setData(titles: months, colors: [.red, .blue], labels: ["Unit sold", "Unit Bought"], items: [unitsSold, unitsBought])
        /// Setup Chart
//        chartView.drawBarShadowEnabled = false
//        chartView.drawValueAboveBarEnabled = true
//
//        chartView.maxVisibleCount = 8
//
//        let xAxis = chartView.xAxis
//        xAxis.labelPosition = .bottom
////        xAxis.labelFont = .systemFont(ofSize: 10)
//        xAxis.granularity = 1
////        xAxis.labelCount = 7
////        xAxis.valueFormatter = DayAxisValueFormatter(chart: chartView)
//        xAxis.drawGridLinesEnabled = false
//        xAxis.avoidFirstLastClippingEnabled = true
//
//
//        let leftAxis = chartView.leftAxis
//        leftAxis.labelFont = .systemFont(ofSize: 10)
//        leftAxis.labelCount = 8
//        leftAxis.valueFormatter = VerticalBarLeftAxisValueFormatter(unit: "襲")
//        leftAxis.labelPosition = .outsideChart
//        leftAxis.spaceTop = 0.15
//        leftAxis.axisMinimum = 0 // FIXME: HUH?? this replaces startAtZero = YES
//        leftAxis.axisLineColor = .clear
//
//        let rightAxis = chartView.rightAxis
//        rightAxis.enabled = false
//
//        let l = chartView.legend
//        l.horizontalAlignment = .center
//        l.verticalAlignment = .bottom
//        l.orientation = .horizontal
//        l.drawInside = false
//        l.form = .circle
//        l.formSize = 9
//        l.font = UIFont(name: "HelveticaNeue-Light", size: 11)!
//        l.xEntrySpace = 4
//
//
//        // Set Data
//        let months = ["Jan", "Feb", "Mar"]
//        let unitsSold = [20.0, 4.0, 6.0]
//        let unitsBought = [10.0, 14.0, 60.0]
//
//        var dataEntries: [BarChartDataEntry] = []
//        var dataEntries1: [BarChartDataEntry] = []
//
//        for i in 0..<months.count {
//
//            let dataEntry = BarChartDataEntry(x: Double(i) , y: unitsSold[i])
//            dataEntries.append(dataEntry)
//
//            let dataEntry1 = BarChartDataEntry(x: Double(i) , y: unitsBought[i])
//            dataEntries1.append(dataEntry1)
//
//        }
//
//        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Unit sold")
//        let chartDataSet1 = BarChartDataSet(entries: dataEntries1, label: "Unit Bought")
//
//        let dataSets: [BarChartDataSet] = [chartDataSet,chartDataSet1]
//        chartDataSet.barCornerRadius = 4
//        chartDataSet.drawValuesEnabled = false
//        chartDataSet1.barCornerRadius = 4
//
//
//        chartDataSet.colors = [UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)]
//        //chartDataSet.colors = ChartColorTemplates.colorful()
//        //let chartData = BarChartData(dataSet: chartDataSet)
//
//        let chartData = BarChartData(dataSets: dataSets)
//
//
//        let groupSpace = 0.5
//        let barSpace = 0.05
//        let barWidth = 0.1
//        // (0.3 + 0.05) * 2 + 0.3 = 1.00 -> interval per "group"
//
//        let groupCount = months.count
//        let startYear = 0
//
//        chartData.barWidth = barWidth;
//        chartView.xAxis.axisMinimum = Double(startYear)
//        let gg = chartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
//        chartView.xAxis.axisMaximum = Double(startYear) + gg * Double(groupCount)
//
//        chartData.groupBars(fromX: Double(startYear), groupSpace: groupSpace, barSpace: barSpace)
//        //chartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
//        chartView.notifyDataSetChanged()
//
//
//        chartView.data = chartData
        
        
        veriticalBarGroupChartView.addHeightConstraint(value: 200)
    }

    
    func addChartView_aos_d_bar_04() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
        titleLabel.text = "Demo: aos_d_bar_04"
        sampleStackView.addArrangedSubview(titleLabel)
        titleLabel.addHeightConstraint(value: 30)
        
        let barChartView = VerticalStackBarChart(frame: CGRect(x: 50, y: 60, width: 400, height: 300))
        barChartView.clipsToBounds = false
        sampleStackView.addArrangedSubview(barChartView)
//        view.addSubview(barChartView)
        barChartView.addHeightConstraint(value: 200)
        sampleStackView.layoutIfNeeded()
        
        barChartView.chartView.legend.enabled = true
        barChartView.chartView.legend.horizontalAlignment = .center
        barChartView.chartView.drawBarShadowEnabled = false
        barChartView.chartView.leftAxis.enabled = false
        
        let chartVisual: StackBarChartVisual = StackBarChartVisual(space: 50, width: 8, bottomTitleSpace: 0)
        barChartView.setStackBarChartVisual(chartVisual)
        
        var chartItems: [StackBarChartItemData] = []
        let barVisual: StackBarVisual = StackBarVisual(radius: 4, normalColor: #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1), highlightColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), normalTextColor: #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1), highlightTextColor: #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1))
        chartItems.append(StackBarChartItemData(stackItems: [StactBarItem(color: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), value: 25.0), StactBarItem(color: #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1), value: 6.0), StactBarItem(color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), value: 7.0)], title: "10울산", valueTitle: "5공식", value: 2.3, barVisual: barVisual))
        chartItems.append(StackBarChartItemData(stackItems: [StactBarItem(color: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), value: 8.0), StactBarItem(color: #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1), value: 9.0), StactBarItem(color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), value: 10.0)],title: "8울산", valueTitle: "15공식", value: 30.0, isHighlight: true, barVisual: barVisual))
        chartItems.append(StackBarChartItemData(stackItems: [StactBarItem(color: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), value: 11.0), StactBarItem(color: #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1), value: 12.0), StactBarItem(color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), value: 13.0)], title: "6울산", valueTitle: "45공식", value: 30.0, barVisual: barVisual))
        chartItems.append(StackBarChartItemData(stackItems: [StactBarItem(color: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), value: 14.0), StactBarItem(color: #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1), value: 15.0), StactBarItem(color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), value: 16.0)], title: "9울산", valueTitle: "75공식", value: 46.0, barVisual: barVisual))

        barChartView.setChartItems(items: chartItems)
    }

    
    
    
}

extension UIView {
    func addHeightConstraint(value: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false

        let heightConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: value)
        self.addConstraints([heightConstraint])
    }
    
//    func addConstraint() {
//        newView.translatesAutoresizingMaskIntoConstraints = false
//        let horizontalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
//        let verticalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
//        let widthConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
//        let heightConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
//        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
//    }
}
