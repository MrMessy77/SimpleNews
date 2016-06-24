//
//  Extensions+UIViewController.swift
//  ServerDaysNews
//
//  Created by MrMessy on 16/4/14.
//  Copyright © 2016年 MrMessy. All rights reserved.
//

import UIKit

extension UIViewController {
    //MARK: 显示viewController
    func showChild(viewController: UIViewController, frame: CGRect) {
        addChildViewController(viewController)
        viewController.view.frame = frame
        view.addSubview(viewController.view)
        viewController.didMoveToParentViewController(self)
    }
    
    //MARK: 隐藏viewController
    func hideChild(viewController: UIViewController) {
        viewController.willMoveToParentViewController(self)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
    }
    
    /**
     *  当使用push的时候隐藏底部的tabbar
     */
    private struct AssociatedKeys {
        static var DescriptiveName = "nsh_DescriptiveName"
    }
    
    var hideBaseTabbarWhenPushed: Bool! {
        get {
            if objc_getAssociatedObject(self, &AssociatedKeys.DescriptiveName) as? Bool == nil {
                return false
            }
            return objc_getAssociatedObject(self, &AssociatedKeys.DescriptiveName) as? Bool
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.DescriptiveName, NSNumber(bool: newValue),objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
