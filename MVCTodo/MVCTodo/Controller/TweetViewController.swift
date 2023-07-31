//
//  TweetViewController.swift
//  MVCTodo
//
//  Created by Owner on 2023/07/31.
//

import UIKit

class TweetViewController: UIViewController {
    
    var tweetListModel: TweetList? {
        didSet {
            registerModel()
        }
    }
    
    override func loadView() {
        super.loadView()
        self.view = TweetListView.make()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tweetListModel = TweetList()
        setTableView()
    }
    
    private func registerModel() {
        guard let model = tweetListModel else { return }
        model.notificationCenter.addObserver(
            forName: .init("changeTweetList"),
            object: nil, queue: nil,
            using: { [unowned self] notification in
                let tweetListView = self.view as! TweetListView
                tweetListView.tableView.reloadData()
            }
        )
    }

    private func setTableView() {
        let tweetListView = self.view as! TweetListView
        tweetListView.tableView.dataSource = tweetListModel
        tweetListView.tableView.delegate = self
        tweetListView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    @objc func onTapTableViewCell() {
        tweetListModel?.addTweetList()
    }
    
}

extension TweetViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onTapTableViewCell()
    }
    
}
