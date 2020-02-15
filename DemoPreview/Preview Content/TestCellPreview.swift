//
//  TweetCellPreview.swift
//  DemoPreview
//
//  Created by kenmaz on 2020/02/15.
//  Copyright © 2020 kenmaz. All rights reserved.
//

import UIKit
import SwiftUI

struct TestCellPreview: PreviewProvider {

    struct Preview: UIViewRepresentable {
        typealias UIViewType = TestView
        let input: TestCell.Input
        init(_ input: TestCell.Input) {
            self.input = input
        }
        func makeUIView(context: UIViewRepresentableContext<Preview>) -> UIViewType {
            return TestView(input: input)
        }
        func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<Preview>) {
            uiView.tableView.reloadData()
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

class TestView: UIView, UITableViewDataSource {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.dataSource = self
        tableView.register(TestCell.self, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    let input: TestCell.Input
    init(input: TestCell.Input) {
        self.input = input
        super.init(frame: .zero)
        addSubview(tableView)
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: tableView.topAnchor),
            bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TestCell
        cell.apply(input: input)
        return cell
    }
}
