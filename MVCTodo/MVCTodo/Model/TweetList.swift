//
//  TweetListModel.swift
//  MVCTodo
//
//  Created by Owner on 2023/07/31.
//

import Foundation
import UIKit

class Tweet {
    let message: String
    
    init(message: String) {
        self.message = message
    }
}

class TweetList: NSObject {
    
    let notificationCenter = NotificationCenter()
    
    private(set) var tweetList: [Tweet] = [
        Tweet(message: "Hello!"),
        Tweet(message: "こんにちは")
    ] {
        didSet {
            notificationCenter.post(name: .init("changeTweetList"), object: nil, userInfo: ["list": tweetList])
        }
    }
    
    func addTweetList() {
        tweetList.append(Tweet(message: "New message"))
    }

}

extension TweetList: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        let tweet = tweetList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = tweet.message
        cell.contentConfiguration = content
        return cell
    }
    
}
