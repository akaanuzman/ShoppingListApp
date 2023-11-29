//
//  OnBoardView.swift
//  ShoppingListApp
//
//  Created by Kaan Uzman on 30/11/23.
//

import Lottie
import SnapKit
import UIKit

protocol OnBoardViewProtocol: AnyObject {
    func onTappedStartButton()
}

final class OnBoardView<T: OnBoardVC>: UIView {
    weak var delegate: OnBoardViewProtocol?

    private let titleLabelText = "Welcome to Shopping List App"
    private let subtitleLabelText =
        "Let's go! Create your shopping list and mark off what you've bought."
    private let startButtonText = "Start"

    private lazy var animationView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: LottieConstants.onboard.rawValue)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .repeat(1.0)
        animationView.play { completed in
            if completed {
                animationView.play()
            }
        }
        return animationView
    }()

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = titleLabelText
        titleLabel.font = .preferredFont(forTextStyle: .title2).boldVersion
        titleLabel.numberOfLines = .zero
        titleLabel.textAlignment = .center
        return titleLabel
    }()

    private lazy var subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text =
            subtitleLabelText
        subtitleLabel.font = .preferredFont(forTextStyle: .title3)
        subtitleLabel.textColor = .systemGray2
        subtitleLabel.numberOfLines = .zero
        subtitleLabel.textAlignment = .center
        return subtitleLabel
    }()

    private lazy var startButton: UIButton = {
        let startButton = UIButton()
        startButton.setTitle(startButtonText, for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.backgroundColor = .systemGreen
        startButton.layer.cornerRadius = RadiusSize.medium.rawValue
        startButton.addAction(startButtonAction, for: .touchUpInside)
        return startButton
    }()

    private lazy var startButtonAction: UIAction = UIAction { _ in
        self.delegate?.onTappedStartButton()
    }

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .white
        addSubview(animationView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(startButton)

        animationView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(0.22)
            make.width.equalTo(snp.width).multipliedBy(1)
            make.height.equalTo(snp.height).multipliedBy(0.5)
        }

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(animationView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(ButtonSize.medium.rawValue)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }
}
