//
//  TweetCell.swift
//  XCodePreviewSample
//
//  Created by kenmaz on 2020/02/15.
//  Copyright © 2020 kenmaz. All rights reserved.
//

import UIKit

final class TweetCell: UIView {
    typealias Input = Tweet

    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .darkText
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = .red

        let stack = UIStackView()
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stack.translatesAutoresizingMaskIntoConstraints = false

        let contentView = self
        contentView.addSubview(stack)
        contentView.topAnchor.constraint(equalTo: stack.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: stack.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: stack.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: stack.trailingAnchor).isActive = true

        stack.addArrangedSubview(messageLabel)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    func apply(input: Input) {
        messageLabel.text = input.message
    }
}
