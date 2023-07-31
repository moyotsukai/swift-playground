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
        tweetListView.tableView.dataSource = self
        tweetListView.tableView.delegate = self
        tweetListView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    @objc func onTapTableViewCell() {
        tweetListModel?.addTweetList()
    }
    
}

extension TweetViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = tweetListModel else { return 0 }
        return model.tweetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = tweetListModel else { return UITableViewCell() }
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        let tweet = model.tweetList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = tweet.message
        cell.contentConfiguration = content
        return cell
    }
    
}

extension TweetViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onTapTableViewCell()
    }
    
}
