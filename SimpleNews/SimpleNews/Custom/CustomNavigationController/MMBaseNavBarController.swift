//
//  MMBaseNavBarController.swift
//  ServerDaysNews
//
//  Created by MrMessy on 16/4/13.
//  Copyright © 2016年 MrMessy. All rights reserved.
//

import UIKit

class MMBaseNavBarController: MMBaseTransitionsController {

    /*容器*/
    private var navBarContainer: UIView!
    /*标题*/
    private var naviTitle: UILabel!
    /*左侧返回按钮*/
    private var leftBtn: UIButton!
    /*标题内容*/
    var navtitle: String! { didSet { setTitle() } }
    /*左侧按钮隐藏/显示状态*/
    var hiddenLeftBtn: Bool! = false { didSet { setLeftBtnHidden() } }
    let screenWidth = UIScreen.mainScreen().bounds.width

    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.enabled = false
        self.defaultView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = true
    }
    //
    
    //MARK: - Private
    private func defaultView() {
        //容器
        navBarContainer = UIView(frame: CGRectMake(0, 0, screenWidth, 64))
        navBarContainer.backgroundColor = navBarColor
        view.addSubview(navBarContainer)
        //标题
        naviTitle = UILabel()
        naviTitle.textAlignment = .Center
        naviTitle.textColor = MMWhiteColor
        naviTitle.font = UIFont.boldSystemFontOfSize(17.0)
        navBarContainer.addSubview(naviTitle)
        naviTitle.snp_makeConstraints { (make) in
            make.centerX.equalTo(navBarContainer.snp_centerX)
            make.top.equalTo(navBarContainer).offset(20)
            make.height.equalTo(44)
        }
        //左侧返回按钮
        leftBtn = UIButton()
        leftBtn.setImage(UIImage(named: "back_button"), forState: UIControlState.Normal)
        leftBtn.addTarget(self, action: #selector(leftBtnDidTouch), forControlEvents: UIControlEvents.TouchUpInside)
        navBarContainer.addSubview(leftBtn)
        leftBtn.snp_makeConstraints { (make) in
            make.leading.equalTo(navBarContainer)
            make.top.equalTo(navBarContainer).offset(20)
            make.height.equalTo(44)
            make.width.equalTo(44)
        }
        
    }
    
    @objc private func leftBtnDidTouch() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    //
    
    //MARK: - Public
    func setTitle() {
        naviTitle.text = navtitle
    }
    
    func setLeftBtnHidden() {
        leftBtn.hidden = hiddenLeftBtn
    }
    //
}
