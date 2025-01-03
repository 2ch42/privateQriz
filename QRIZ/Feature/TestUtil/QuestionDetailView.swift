//
//  QuestionDetailView.swift
//  QRIZ
//
//  Created by ch on 12/20/24.
//

import UIKit

final class QuestionDetailView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        
        self.layer.shadowColor = UIColor.customBlue100.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 4, height: 6)
        self.layer.shadowRadius = 4
        // descripton, ... etc should be added
    }
    
    required init?(coder: NSCoder) {
        fatalError("no initializer for coder: QuestionDetailView")
    }
}
