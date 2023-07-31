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

