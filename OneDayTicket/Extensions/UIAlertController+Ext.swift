//
//  UIAlertController+Ext.swift
//  OpenAlign
//
//  Created by Andy Wu on 2020/4/21.
//  Copyright © 2020 OpenAlign. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {

    static func showOkAlertBox(title: String? = nil, message: String? = nil,vc:UIViewController, okHandler: ((UIAlertAction) -> Void)? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: Strings.ok, style: .cancel, handler: nil)
        alert.addAction(confirm)
        vc.present(alert, animated: true, completion: nil)
    }
    
    
    static func showOkCancelAlertBox(title: String? = nil, message: String? = nil,vc:UIViewController, okHandler: ((UIAlertAction) -> Void)? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: Strings.ok, style: .default, handler: okHandler)
        let cancel = UIAlertAction(title: Strings.cancel, style: .cancel, handler: nil )
        alert.addAction(cancel)
        alert.addAction(confirm)
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func showUpdateCancelAlertBox(title: String? = nil, message: String? = nil,vc:UIViewController, okHandler: ((UIAlertAction) -> Void)? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: Strings.update, style: .default, handler: okHandler)
        let cancel = UIAlertAction(title: Strings.cancel, style: .cancel, handler: nil )
        alert.addAction(cancel)
        alert.addAction(confirm)
        vc.present(alert, animated: true, completion: nil)
    }
    
    
    static func showUpdateAlertBox(title: String? = nil, message: String? = nil,buttonName:String? = Strings.update,vc:UIViewController, okHandler: ((UIAlertAction) -> Void)? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: buttonName, style: .default, handler: okHandler)
        alert.addAction(confirm)
        vc.present(alert, animated: true, completion: nil)
    }
    
    
    static func showAlertBox(title: String? = nil, message: String? = nil,vc:UIViewController, okHandler: ((UIAlertAction) -> Void)? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        vc.present(alert, animated: true, completion: nil)
    }
}
