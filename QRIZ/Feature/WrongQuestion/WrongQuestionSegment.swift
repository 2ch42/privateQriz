//
//  WrongQuestionSegment.swift
//  QRIZ
//
//  Created by 이창현 on 1/14/25.
//

import UIKit

final class WrongQuestionSegment: UIView {
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.insertSegment(withTitle: "데일리", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "모의고사", at: 1, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .white
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.coolNeutral400, .font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.coolNeutral800, .font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .selected)
        segmentedControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        return segmentedControl
    }()
    
    init() {
        super.init(frame: .zero)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addViews() {

        addSubview(segmentedControl)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            segmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            segmentedControl.topAnchor.constraint(equalTo: self.topAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

