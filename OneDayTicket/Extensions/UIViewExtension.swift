//
//  UIViewExtension.swift
//  BizCloud
//
//  Created by on
//  Copyright © 2016年. All rights reserved.
//

import UIKit
import Foundation

enum KSLayoutConstraintType {
    case bounding
    case padding
    case notchTop, notchBottom, notchLeft, notchRight
    case topLeft, topCenter, topRight
    case center
    case absolute
}

extension UIBarButtonItem {

    static func menuButton(_ target: Any?, action: Selector, imageName: String) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)

        let menuBarItem = UIBarButtonItem(customView: button)
        menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 36).isActive = true
        menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 36).isActive = true

        return menuBarItem
    }
    
    static func menuButton1(_ target: Any?, action: Selector, image: UIImage) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)

        let menuBarItem = UIBarButtonItem(customView: button)
        menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 36).isActive = true
        menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 36).isActive = true

        return menuBarItem
    }
}

extension UIView {
    
    //sean
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }}
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }}
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }}
    
    func addLayoutConstraints(_ subview: UIView, type: KSLayoutConstraintType) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        switch type {
        case .bounding:
            addBoundingLayoutConstraints(subview)
        case .padding:
            addPaddingLayoutConstraints(subview)
        case .center:
            addCenterLayoutConstraints(subview)
        default: break
        }
    }
    
    func addBoundingLayoutConstraints(_ subview: UIView) {
        let top = NSLayoutConstraint.init(item: subview, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint.init(item: subview, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint.init(item: subview, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0)
        let right = NSLayoutConstraint.init(item: subview, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0)
        addConstraints([top, bottom, left, right])
    }
    
    fileprivate func addPaddingLayoutConstraints(_ subview: UIView) {
        let top = NSLayoutConstraint.init(item: subview, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: subview.frame.origin.y)
        let bottom = NSLayoutConstraint.init(item: subview, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: subview.frame.origin.y + subview.frame.size.height - self.frame.size.height)
        let left = NSLayoutConstraint.init(item: subview, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: subview.frame.origin.x)
        let right = NSLayoutConstraint.init(item: subview, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: (subview.frame.origin.x + subview.frame.size.width) - self.frame.size.width)
        addConstraints([top, bottom, left, right])
    }
    
    fileprivate func addTopNotchLayoutConstraint(_ subview: UIView) {
        
    }
    
    fileprivate func addBottomNotchLayoutConstraint(_ subview: UIView) {
        
    }
    
    fileprivate func addLeftNotchLayoutConstraint(_ subview: UIView) {
        
    }
    
    fileprivate func addRightNotchLayoutConstraint(_ subview: UIView) {
        
    }
    
    fileprivate func addCenterLayoutConstraints(_ subview: UIView) {
        let x = NSLayoutConstraint.init(item: subview, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let y = NSLayoutConstraint.init(item: subview, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        let width = NSLayoutConstraint.init(item: subview, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: subview.frame.size.width)
        let height = NSLayoutConstraint.init(item: subview, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: subview.frame.size.height)
        addConstraints([x, y, width, height])
    }
}

extension UIView {
    
    static func fromXib<T>(_ type: T.Type, name: String) -> T? {
        return Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T
    }
    
   func showToast(text: String){
        
        self.hideToast()
        let toastLb = UILabel()
        toastLb.numberOfLines = 0
        toastLb.lineBreakMode = .byWordWrapping
        toastLb.backgroundColor = UIColor.gray
        toastLb.textColor = UIColor.white
        toastLb.layer.cornerRadius = 10.0
        toastLb.textAlignment = .center
        toastLb.font = UIFont.systemFont(ofSize: 15.0)
        toastLb.text = text
        toastLb.layer.masksToBounds = true
        toastLb.tag = 9999//tag：hideToast實用來判斷要remove哪個label
        
        let maxSize = CGSize(width: self.bounds.width - 40, height: self.bounds.height)
        var expectedSize = toastLb.sizeThatFits(maxSize)
        var lbWidth = maxSize.width
        var lbHeight = maxSize.height
        if maxSize.width >= expectedSize.width{
            lbWidth = expectedSize.width
        }
        if maxSize.height >= expectedSize.height{
            lbHeight = expectedSize.height
        }
        expectedSize = CGSize(width: lbWidth, height: lbHeight)
        toastLb.frame = CGRect(x: ((self.bounds.size.width)/2) - ((expectedSize.width + 20)/2), y: self.bounds.height - expectedSize.height - 40 - 20, width: expectedSize.width + 20, height: expectedSize.height + 20)
        self.addSubview(toastLb)
        
        UIView.animate(withDuration: 1.5, delay: 1.5, animations: {
            toastLb.alpha = 0.0
        }) { (complete) in
            toastLb.removeFromSuperview()
        }
    }
    
    func hideToast(){
        for view in self.subviews{
            if view is UILabel , view.tag == 9999{
                view.removeFromSuperview()
            }
        }
    }
}

protocol UIViewXib {
    
    static var xibName: String { get }
}

protocol UIViewXibLoader: UIViewXib {
    
    static func loadXib() -> UIView?
}

extension UITableView {
    
    func registerNibHeader(_ xib: UIViewXib.Type) {
        register(UINib(nibName: xib.xibName, bundle: nil), forHeaderFooterViewReuseIdentifier: xib.xibName)
    }
}

protocol SeguePerformer {
    
    var seguePerformer: UIViewController? { get set }
}
