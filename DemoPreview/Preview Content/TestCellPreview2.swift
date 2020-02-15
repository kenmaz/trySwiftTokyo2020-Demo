//
//  TweetCellPreview.swift
//  DemoPreview
//
//  Created by kenmaz on 2020/02/15.
//  Copyright © 2020 kenmaz. All rights reserved.
//

import UIKit
import SwiftUI

struct TestCellPreview2: PreviewProvider {

    struct Preview: UIViewRepresentable {
        typealias UIViewType = UIView
        let cell: TestCell
        init(_ input: TestCell.Input) {
            cell = TestCell()
            cell.apply(input: input)
        }
        func makeUIView(context: UIViewRepresentableContext<Preview>) -> UIViewType {
            return PreviewContainer(view: cell.contentView)
        }
        func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<Preview>) {
        }
    }

    static var previews: some View {
        Group {
            Preview(.init(message: "Test", isFavorited: false))
            Preview(.init(message: "Test2eeeeeeeeeeee2222 eeeeeeeeeeeeeeeeeeeeeeee", isFavorited: false))
            Preview(.init(message: "Test2eeeeeeeeeeee2222 eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee", isFavorited: false))
        }.previewLayout(.fixed(width: 320, height: 180))
    }

    static var platform: PreviewPlatform? = .iOS
}
