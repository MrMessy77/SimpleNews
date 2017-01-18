//
//  NewsViewModel.swift
//  SimpleNews
//
//  Created by MrMessy on 2017/1/14.
//  Copyright © 2017年 MrMessy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class NewsViewModel: BaseViewModel, UITableViewDelegate {
    
    let disposeBag = DisposeBag()

    func prepare(tableView: UITableView) {
        tableView.rx_setDelegate(self).addDisposableTo(disposeBag)
        
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String,String>>()
        
        let sections = [
            SectionModel(model: "aaa", items: ["1","2","3","4","5","6"]),
            SectionModel(model: "aaa", items: ["1","2","3","4","5","6"])
        ]
        let items = Observable.just(sections)
        
        dataSource.configureCell = {dataSource,tableView,indexPath,user in
            let cell = tableView.dequeueReusableCellWithIdentifier("BaseCell", forIndexPath: indexPath) as! BaseCell
            cell.tag = indexPath.row
            return cell
        }
        
        items.bindTo(tableView.rx_itemsWithDataSource(dataSource)).addDisposableTo(disposeBag)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 94
    }
}

