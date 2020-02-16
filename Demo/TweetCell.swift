//
//  TweetCell.swift
//  XCodePreviewSample
//
//  Created by kenmaz on 2020/02/15.
//  Copyright © 2020 kenmaz. All rights reserved.
//

import UIKit

final class TweetCell: UITableViewCell {
    typealias Input = Tweet

    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = UIColor(named: "BodyText")
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    private lazy var avatarImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "avatar"))
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 32),
            view.heightAnchor.constraint(equalToConstant: 32),
        ])
        return view
    }()

    private lazy var pictureImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "picture"))
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if #available(iOS 13.0, *) {
            contentView.backgroundColor = .systemBackground
        } else {
            contentView.backgroundColor = .white
        }

        let stack = UIStackView(axis: .horizontal, alignment: .top, spacing: 8, padding: UIEdgeInsets.all(16), subviews: [
            avatarImageView,
            UIStackView(axis: .vertical, spacing: 8, subviews:[
                messageLabel,
                pictureImageView,
            ])
        ])
        contentView.addSubview(stack)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: stack.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: stack.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    func apply(input: Input) {
        messageLabel.text = input.message
        pictureImageView.isHidden = !input.hasPicture
    }
}

extension UIEdgeInsets {
    static func all(_ value: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
}

extension UIStackView {
    public convenience init(
        axis: NSLayoutConstraint.Axis,
        alignment: UIStackView.Alignment = .fill,
        spacing: CGFloat = 0,
        distribution: UIStackView.Distribution = .fill,
        padding: UIEdgeInsets? = nil,
        subviews: [UIView]
    ){
        self.init(arrangedSubviews: subviews)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alignment = alignment
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        if let padding = padding {
            isLayoutMarginsRelativeArrangement = true
            layoutMargins = padding
        }
    }

    public func with(_ block: (UIStackView) -> Void) -> UIStackView {
        block(self)
        return self
    }
}
