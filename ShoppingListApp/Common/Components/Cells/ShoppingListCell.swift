//
//  TableViewCell.swift
//  ShoppingListApp
//
//  Created by Kaan Uzman on 12/12/23.
//

import UIKit

#warning("TODO: Make a model for this cell.")
final class ShoppingListCell: UITableViewCell {
    static let identifier = TableViewIdentifiers.shoppingList.rawValue

    private lazy var leadingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemGreen
        imageView.image = SFSymbols.basketFill
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Egg"
        titleLabel.font = .preferredFont(forTextStyle: .title3)
        titleLabel.textColor = .label
        return titleLabel
    }()

    private lazy var amountSubtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.text = "1 kg"
        subtitleLabel.font = .preferredFont(forTextStyle: .subheadline)
        subtitleLabel.textColor = .secondaryLabel
        return subtitleLabel
    }()

    private lazy var priceSubtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.text = "1 TL"
        subtitleLabel.font = .preferredFont(forTextStyle: .subheadline)
        subtitleLabel.textColor = .secondaryLabel
        return subtitleLabel
    }()

    private lazy var categoryView: UIButton = {
        let startButton = UIButton()
        startButton.configuration = .tinted()
        startButton.configuration?.cornerStyle = .large
        startButton.configuration?.baseBackgroundColor = .systemGreen
        startButton.configuration?.baseForegroundColor = .systemGreen
        startButton.setTitle("Fruit", for: .normal)
        return startButton
    }()

    private lazy var trailingRadioButton: UIButton = {
        let button = UIButton()
        let selectedImage = SFSymbols.fillCircle
        let unselectedImage = SFSymbols.circle

        button.setImage(unselectedImage, for: .normal)
        button.setImage(selectedImage, for: .selected)
        button.tintColor = .systemGreen
        button.addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func radioButtonTapped() {
        trailingRadioButton.isSelected.toggle()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell(with shoppingItem: ShoppingListModel) {
        titleLabel.text = shoppingItem.productName
        amountSubtitleLabel.text = "\(shoppingItem.amount) \(shoppingItem.amountType)"
        priceSubtitleLabel.text = "\(shoppingItem.money) \(shoppingItem.moneyType.rawValue)"
        categoryView.setTitle("\(shoppingItem.category)", for: .normal)
    }

    private func configure() {
        addSubview(leadingImageView)
        addSubview(titleLabel)
        addSubview(amountSubtitleLabel)
        addSubview(categoryView)
        addSubview(trailingRadioButton)
        addSubview(priceSubtitleLabel)

        leadingImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(8)
            make.height.equalTo(24)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(leadingImageView.snp.trailing).offset(16)
            make.top.equalToSuperview().offset(8)
        }

        amountSubtitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(leadingImageView.snp.trailing).offset(16)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }

        categoryView.snp.makeConstraints { make in
            make.leading.equalTo(leadingImageView.snp.trailing).offset(16)
            make.top.equalTo(amountSubtitleLabel.snp.bottom).offset(8)
        }

        trailingRadioButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }

        priceSubtitleLabel.snp.makeConstraints { make in
            make.trailing.equalTo(trailingRadioButton.snp.leading).offset(-16)
            make.centerY.equalToSuperview()
        }
    }
}

#Preview {
    ShoppingListCell()
}
