//
//  TempViewController.swift
//  QRIZ
//
//  Created by ch on 12/13/24.
//

import UIKit

class TempViewController: UIViewController {
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Test", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(testOnboarding), for: .touchUpInside)
        return button
    }()
    
    @objc func testOnboarding() {
        let vc = PreviewResultViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        nav.isModalInPresentation = true
        self.present(nav, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.button.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            self.button.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            self.button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.button.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
