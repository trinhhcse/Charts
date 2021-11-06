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
    }
    
    
    func addChartView_aos_d_bar_01() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
        titleLabel.text = "Demo: aos_d_bar_01"
        sampleStackView.addArrangedSubview(titleLabel)
        titleLabel.addHeightConstraint(value: 30)
        
        let barChartView = VeritalBarChartView(frame: CGRect(x: 50, y: 60, width: 400, height: 300))
        barChartView.clipsToBounds = false
        sampleStackView.addArrangedSubview(barChartView)
//        view.addSubview(barChartView)
        barChartView.addHeightConstraint(value: 400)
        sampleStackView.layoutIfNeeded()
        
        var chartItems: [BarChartItemData] = []
        chartItems.append(BarChartItemData(title: "10울산", valueTitle: "5공식", value: 2.3, barVisual: BarVisual.defaultVisual()))
        chartItems.append(BarChartItemData(title: "8울산", valueTitle: "15공식", value: 30.0, isHighlight: true, barVisual: BarVisual.defaultVisual()))
        chartItems.append(BarChartItemData(title: "6울산", valueTitle: "45공식", value: 30.0, barVisual: BarVisual.defaultVisual()))
        chartItems.append(BarChartItemData(title: "9울산", valueTitle: "75공식", value: 46.0, barVisual: BarVisual.defaultVisual()))
        chartItems.append(BarChartItemData(title: "8울산", valueTitle: "15공식", value: 46.0, isHighlight: true, barVisual: BarVisual.defaultVisual()))

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
