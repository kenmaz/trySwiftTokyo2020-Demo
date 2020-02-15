//
//  TweetCellPreview.swift
//  DemoPreview
//
//  Created by kenmaz on 2020/02/15.
//  Copyright © 2020 kenmaz. All rights reserved.
//

import UIKit
import SwiftUI

final class PreviewContainer: UIView {
    let view: UIView
    init(view: UIView, fillHorizontal: Bool = true, fillVertical: Bool = false) {
        self.view = view
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        NSLayoutConstraint.activate([
            view.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            view.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
        if fillHorizontal {
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ])
        }
        if fillVertical {
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: self.topAnchor),
                view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
        }

    }

    required init(coder: NSCoder) {
        fatalError()
    }

    override func didMoveToSuperview() {
        guard let parent = superview else { return }
        NSLayoutConstraint.activate([
            parent.topAnchor.constraint(equalTo: topAnchor),
            parent.bottomAnchor.constraint(equalTo: bottomAnchor),
            parent.leadingAnchor.constraint(equalTo: leadingAnchor),
            parent.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])

    }
}
