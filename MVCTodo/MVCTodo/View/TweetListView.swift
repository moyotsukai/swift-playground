//
//  TweetListView.swift
//  MVCTodo
//
//  Created by Owner on 2023/07/31.
//

import UIKit

class TweetListView: UIView {

    @IBOutlet var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func make() -> TweetListView {
        let view = UINib(nibName: "TweetListView", bundle: nil)
            .instantiate(withOwner: nil, options: nil)
            .first as! TweetListView
        return view
    }
    
//    func loadNib() {
//        let view = Bundle.main.loadNibNamed("TweetListView", owner: self)?.first as! UIView
//        view.frame = self.bounds
//        self.addSubview(view)
//    }

}
