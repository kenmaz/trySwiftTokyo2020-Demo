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
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        let const = view.heightAnchor.constraint(equalToConstant: 80)
        const.priority = .defaultHigh
        const.isActive = true
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

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
        setHighlighted(false, animated: false)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            contentView.backgroundColor = .lightGray
        } else {
            if #available(iOS 13.0, *) {
                contentView.backgroundColor = .systemBackground
            } else {
                contentView.backgroundColor = .white
            }
        }
    }

    func apply(input: Input) {
        messageLabel.text = input.message

        if let picture = input.picture {
            pictureImageView.isHidden = false
            pictureImageView.image = picture
        } else {
            pictureImageView.isHidden = true
        }
    }
}

extension UIEdgeInsets {
    static func all(_ value: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
}
