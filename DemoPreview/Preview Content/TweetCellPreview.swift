//
//  TweetCellPreview.swift
//  DemoPreview
//
//  Created by kenmaz on 2020/02/15.
//  Copyright © 2020 kenmaz. All rights reserved.
//

import UIKit
import SwiftUI

struct TweetCellPreview: PreviewProvider {

    struct Preview: UIViewRepresentable {
        typealias UIViewType = PreviewContainer
        let cell: TweetCell
        init(_ input: TweetCell.Input) {
            cell = TweetCell()
            cell.apply(input: input)
        }
        func makeUIView(context: UIViewRepresentableContext<Preview>) -> UIViewType {
            return PreviewContainer(view: cell.contentView)
        }
        func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<Preview>) {
        }
    }

    static let text = "Hello, try! Swift Tokyo. Hello, try! Swift Tokyo"
    static let longText = "Very long long long long long long long long long long long long long long Text"

    static var previews: some View {
        Group {
            Preview(.init(message: text))
                .previewDisplayName("Short text")
            Preview(.init(message: longText))
                .previewDisplayName("Long text")
            Preview(.init(message: text, picture: UIImage(named: "picture")))
                .previewDisplayName("With picture")
            Preview(.init(message: text))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark mode")
            Preview(.init(message: text))
                .environment(\.sizeCategory, .accessibilityLarge)
                .previewDisplayName("Large text")
            Preview(.init(message: text))
                .environment(\.sizeCategory, .extraSmall)
                .previewDisplayName("Small text")
            Preview(.init(message: "مرحبا ، حاول! سويفت طوكيو."))
                .environment(\.layoutDirection, .rightToLeft)
                .previewDisplayName("Right to left")

        }.previewLayout(.fixed(width: 320, height: 180))
    }

    static var platform: PreviewPlatform? = .iOS
}
