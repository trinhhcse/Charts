//
//  VerticalBarChartDemoViewController.swift
//  ChartsDemo-iOS-Swift
//
//  Created by dongha on 04/11/2021.
//  Copyright © 2021 dcg. All rights reserved.
//

import UIKit

class VerticalBarChartDemoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addChartView()
    }
    
    
    func addChartView() {
        let barChartView = VeritalBarChartView(frame: CGRect(x: 50, y: 50, width: 400, height: 400))
        view.addSubview(barChartView)
    }
}
