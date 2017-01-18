//
//  BaseTableView.swift
//  SimpleNews
//
//  Created by MrMessy on 2017/1/18.
//  Copyright © 2017年 MrMessy. All rights reserved.
//

import UIKit

class BaseTableView: UIView {

    var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.placeSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 放置子视图

    private func placeSubViews() {
        tableView = UITableView()
        tableView.separatorStyle = .None
        tableView.backgroundColor = color_Clear
        tableView.tableFooterView = UIView()
        self.addSubview(tableView)
        tableView.mm_CenterEqual(self).mm_SizeEqual(self)
        //注册默认cell信息
        tableView.registerClass(BaseCell.self, forCellReuseIdentifier: "BaseCell")
    }
}
