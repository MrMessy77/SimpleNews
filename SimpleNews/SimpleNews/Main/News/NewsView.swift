//
//  NewsView.swift
//  SimpleNews
//
//  Created by MrMessy on 2017/1/16.
//  Copyright © 2017年 MrMessy. All rights reserved.
//

import UIKit

class NewsView: BaseTableView {

    convenience init(view: UIView) {
        self.init()
        view.addSubview(self)
        self.mm_CenterEqual(view).mm_SizeEqual(view)
        //注册cell信息
        self.tableView.registerClass(NewsCell.self, forCellReuseIdentifier: "NewsCell")
    }
}

class NewsCell: UITableViewCell {
    
    var picView: UIImageView!
    var titleLab: UILabel!
    var decLab: UILabel!
    var dateLab: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
