//
//  UIKit+Extension.swift
//  Demo
//
//  Created by kenmaz on 2020/02/16.
//  Copyright © 2020 kenmaz. All rights reserved.
//

import UIKit

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
