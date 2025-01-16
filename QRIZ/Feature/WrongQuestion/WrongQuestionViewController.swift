//
//  WrongQuestionViewController.swift
//  QRIZ
//
//  Created by 이창현 on 1/14/25.
//

import UIKit

final class WrongQuestionViewController: UIViewController {
    
    private let wrongQuestionTitleLabel = WrongQuestionTitleLabel()
    private let wrongQuestionSegment =  WrongQuestionSegment()
    private let segmentBorder: UIView = {
        let view = UIView()
        view.backgroundColor = .coolNeutral100
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "오답노트"
        addViews()
    }
}

// MARK: - Autolayout
extension WrongQuestionViewController {

    private func addViews() {
        self.view.addSubview(wrongQuestionTitleLabel)
        self.view.addSubview(wrongQuestionSegment)
        self.view.addSubview(segmentBorder)

        wrongQuestionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        wrongQuestionSegment.translatesAutoresizingMaskIntoConstraints = false
        segmentBorder.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            wrongQuestionTitleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            wrongQuestionTitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            wrongQuestionTitleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            wrongQuestionTitleLabel.heightAnchor.constraint(equalToConstant: 48),

            wrongQuestionSegment.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 18),
            wrongQuestionSegment.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -18),
            wrongQuestionSegment.topAnchor.constraint(equalTo: wrongQuestionTitleLabel.bottomAnchor),
            wrongQuestionSegment.heightAnchor.constraint(equalToConstant: 48),
            
            segmentBorder.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            segmentBorder.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            segmentBorder.topAnchor.constraint(equalTo: wrongQuestionSegment.bottomAnchor),
            segmentBorder.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        self.view.bringSubviewToFront(wrongQuestionTitleLabel)
    }
}
