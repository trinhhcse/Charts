//
//  VerticalBarChartDemoViewController.swift
//  ChartsDemo-iOS-Swift
//
//  Created by dongha on 04/11/2021.
//  Copyright © 2021 dcg. All rights reserved.
//

import UIKit

class VerticalBarChartDemoViewController: UIViewController {
    @IBOutlet weak var sampleStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addChartView_aos_d_bar_01()
        addChartView_aos_d_bar_03()
    }
    
    
    func addChartView_aos_d_bar_01() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
        titleLabel.text = "Demo: aos_d_bar_01"
        sampleStackView.addArrangedSubview(titleLabel)
        titleLabel.addHeightConstraint(value: 30)
        
        let barChartView_Bar_01 = VeritalBarChartView(frame: CGRect(x: 50, y: 60, width: 400, height: 300))
        barChartView_Bar_01.clipsToBounds = false
        sampleStackView.addArrangedSubview(barChartView_Bar_01)
        barChartView_Bar_01.addHeightConstraint(value: 200)
        sampleStackView.layoutIfNeeded()
        
        barChartView_Bar_01.chartView.leftAxis.enabled = false
        
        let chartVisual: ChartVisual = ChartVisual(space: 50, width: 8, bottomTitleSpace: 0)
        barChartView_Bar_01.setChartVisual(chartVisual)
        
        var chartItems: [BarChartItemData] = []
        let barVisual: BarVisual = BarVisual(radius: 4, normalColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), highlightColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), normalTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), highlightTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        chartItems.append(BarChartItemData(title: "10울산", valueTitle: "5공식", value: 2.3, barVisual: barVisual))
        chartItems.append(BarChartItemData(title: "8울산", valueTitle: "15공식", value: 30.0, isHighlight: true, barVisual: barVisual))
        chartItems.append(BarChartItemData(title: "6울산", valueTitle: "45공식", value: 30.0, barVisual: barVisual))
        chartItems.append(BarChartItemData(title: "9울산", valueTitle: "75공식", value: 46.0, barVisual: barVisual))

        barChartView_Bar_01.setChartItems(items: chartItems)
    }
    
    func addChartView_aos_d_bar_03() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
        titleLabel.text = "Demo: aos_d_bar_03"
        sampleStackView.addArrangedSubview(titleLabel)
        titleLabel.addHeightConstraint(value: 30)
        
        let barChartView_Bar_01 = VeritalBarChartView(frame: CGRect(x: 50, y: 60, width: 400, height: 300))
        barChartView_Bar_01.clipsToBounds = false
        sampleStackView.addArrangedSubview(barChartView_Bar_01)
//        view.addSubview(barChartView_Bar_01)
        barChartView_Bar_01.addHeightConstraint(value: 200)
        sampleStackView.layoutIfNeeded()
        
        barChartView_Bar_01.chartView.leftAxis.enabled = false
        
        let chartVisual: ChartVisual = ChartVisual(space: 50, width: 8, bottomTitleSpace: 0)
        barChartView_Bar_01.setChartVisual(chartVisual)
        
        var chartItems: [BarChartItemData] = []
        let barVisual: BarVisual = BarVisual(radius: 4, normalColor: #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1), highlightColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), normalTextColor: #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1), highlightTextColor: #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1))
        chartItems.append(BarChartItemData(title: "10울산", valueTitle: "5공식", value: 2.3, barVisual: barVisual))
        chartItems.append(BarChartItemData(title: "8울산", valueTitle: "15공식", value: 30.0, isHighlight: true, barVisual: barVisual))
        chartItems.append(BarChartItemData(title: "6울산", valueTitle: "45공식", value: 30.0, barVisual: barVisual))
        chartItems.append(BarChartItemData(title: "9울산", valueTitle: "75공식", value: 46.0, barVisual: barVisual))

        barChartView_Bar_01.setChartItems(items: chartItems)
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
