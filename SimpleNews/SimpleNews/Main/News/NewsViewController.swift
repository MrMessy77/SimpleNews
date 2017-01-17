//
//  NewsViewController.swift
//  SimpleNews
//
//  Created by MrMessy on 2017/1/14.
//  Copyright © 2017年 MrMessy. All rights reserved.
//

import UIKit

class NewsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView()
        tableView.separatorStyle = .None
        tableView.backgroundColor = color_Clear
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.center.equalTo(view.snp_center)
            make.size.equalTo(view.bounds.size)
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewCell
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
