//
//  BaseCell.swift
//  SimpleNews
//
//  Created by MrMessy on 2017/1/16.
//  Copyright © 2017年 MrMessy. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell {

    /** 图片 */
    var basePic: UIImageView!
    /** 标题 */
    var baseTitle: UILabel!
    /** 详情 */
    var baseDec: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .None
        backgroundColor = color_Clear
        
        self.initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 初始化子视图

    private func initSubviews() {
        basePic = UIImageView()
        basePic.backgroundColor = UIColor.colorWithHexCode("#333333").colorWithAlphaComponent(0.7)
        contentView.addSubview(basePic)
        basePic.snp_makeConstraints { (make) in
            make.leading.equalTo(10)
            make.top.equalTo(15)
            make.bottom.equalTo(15)
            make.height.equalTo(80)
            make.width.equalTo(120)
        }
        
        baseTitle = UILabel()
        baseTitle.backgroundColor = UIColor.colorWithHexCode("#333333").colorWithAlphaComponent(0.7)
        contentView.addSubview(baseTitle)
        baseTitle.snp_makeConstraints { (make) in
            make.leading.equalTo(basePic.snp_trailing).offset(15)
            make.top.equalTo(basePic.snp_top).offset(2)
            make.height.equalTo(5)
            make.width.equalTo(CGFloat(220).scale_W)
        }
        
        baseDec = UILabel()
        baseDec.backgroundColor = UIColor.colorWithHexCode("#333333").colorWithAlphaComponent(0.7)
        contentView.addSubview(baseDec)
        baseDec.snp_makeConstraints { (make) in
            make.leading.equalTo(baseTitle.snp_leading)
            make.top.equalTo(baseTitle.snp_bottom).offset(10)
            make.height.equalTo(5)
            make.width.equalTo(CGFloat(150).scale_W)
        }
    }
}
