//
//  GreetingViewController.swift
//  QRIZ
//
//  Created by ch on 12/14/24.
//

import UIKit
import Combine

class GreetingViewController: UIViewController {
    
    private var nickname: String = "임시"
    private var greetingTitleLabel: UILabel = OnboardingTitleLabel(labelText: "님\n환영합니다")
    private let greetingSubtitleLabel: UILabel = OnboardingSubtitleLabel("준비되어 있는 오늘의 공부와, 모의고사로\n시험을 같이 준비해봐요!")
    private let greetingImageView: UIImageView = OnboardingImageView("onboarding3")
    
    private var viewModel: GreetingViewModel = GreetingViewModel()
    private var subscriptions = Set<AnyCancellable>()
    private let input: PassthroughSubject<GreetingViewModel.Input, Never> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .customBlue50
        self.navigationItem.hidesBackButton = true
        bind()
        greetingTitleLabel.text = self.nickname + greetingTitleLabel.text!
        addViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.input.send(.viewDidAppear)
    }
    
    private func bind() {
        let output = viewModel.transform(input: input.eraseToAnyPublisher())
        
        output
            .receive(on: RunLoop.main)
            .sink { [weak self] event in
                guard let self = self else { return }
                switch event {
                case .moveToHome:
                    // coordinator role
                    self.dismiss(animated: true)
                }
            }
            .store(in: &subscriptions)
    }
    
    private func addViews() {
        self.view.addSubview(greetingTitleLabel)
        self.view.addSubview(greetingSubtitleLabel)
        self.view.addSubview(greetingImageView)
        
        greetingTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        greetingSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        greetingImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            greetingTitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            greetingTitleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
            greetingTitleLabel.topAnchor.constraint(lessThanOrEqualTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            greetingTitleLabel.heightAnchor.constraint(equalToConstant: 76),
            greetingSubtitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            greetingSubtitleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
            greetingSubtitleLabel.topAnchor.constraint(equalTo: greetingTitleLabel.bottomAnchor, constant: 8),
            greetingSubtitleLabel.heightAnchor.constraint(equalToConstant: 48),
            greetingImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            greetingImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            greetingImageView.topAnchor.constraint(equalTo: greetingSubtitleLabel.bottomAnchor, constant: 40)
        ])
    }
}
