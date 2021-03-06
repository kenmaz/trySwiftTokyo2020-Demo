//
//  ViewController.swift
//  XCodePreviewSample
//
//  Created by kenmaz on 2020/02/15.
//  Copyright © 2020 kenmaz. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var tweets: [Tweet] = [
        Tweet(message: "Hello, try! Swift Tokyo"),
        Tweet(message: "Hello, iOS Developer"),
        Tweet(message: "I'm sleepy"),
        Tweet(message: "Long Text Long Text Long Text Long Text Long Text Long Text Long Text Long Text Long Text Long Text Long Text Long Text Long Text Long Text Long Text "),
        Tweet(message: "Hello, try! Swift Tokyo", picture: UIImage(named: "picture")),
        Tweet(message: "Hello, iOS Developer", picture: UIImage(named: "picture")),
        Tweet(message: "I'm sleepy", picture: UIImage(named: "picture")),
        Tweet(message: "Long Text Long Text Long Text Long Text Long Text Long Text Long Text Long Text Long Text Long Text Long Text Long Text Long Text Long Text Long Text ", picture: UIImage(named: "picture")),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Demo App"
        tableView.register(TweetCell.self, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TweetCell
        cell.apply(input: tweets[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
