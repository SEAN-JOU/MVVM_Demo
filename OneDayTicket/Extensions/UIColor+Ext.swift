//
//  UIColor+Ext.swift
//  OpenAlign
//
//  Created by AndyWu on 2020/3/12.
//  Copyright © 2020 OpenAlign. All rights reserved.
//

import Foundation
import UIKit

// Some custom colors
extension UIColor {
    /// Open Align navigation bar color
    public static let navColor = UIColor(red: 14/255.0, green: 36/255.0, blue: 62/255.0, alpha: 1.0)
    public static let warning = UIColor(red: 246/255, green: 194/255, blue: 49/255, alpha: 1)
    
    public static let systemColor = UIColor(red: 14/255.0, green: 36/255.0, blue: 62/255.0, alpha: 0.5)

    
    public static let permissionControlColor = UIColor.black
    public static let permissionEditColor = UIColor(rgb: 0x4c7ab2)
    public static let permissionShareColor = UIColor(rgb: 0xc00000)
    public static let permissionViewColor = UIColor(rgb: 0x748F3C)
}

// Open Align blue
extension UIColor {
    /// Open Align blue
    public static let blue0 = UIColor(rgb: 0xDAE4F0)
    /// Open Align blue
    public static let blue1 = UIColor(rgb: 0xB6C9DF)
    /// Open Align blue
    public static let blue2 = UIColor(rgb: 0x22A5DE)
    /// Open Align blue
    public static let blue3 = UIColor(rgb: 0x4C7AB2)
    /// Open Align blue
    public static let blue4 = UIColor(rgb: 0x1F4678)
    /// Open Align blue
    public static let blue5 = UIColor(rgb: 0x0E243E)
    
    
    public static let defaultColor = UIColor(rgb: 0x343A40)
    
}

extension UIColor {
    public convenience init(rgb: Int) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8)  / 255.0,
            blue: CGFloat((rgb & 0x0000FF) >> 0)  / 255.0,
            alpha: 1)
    }
}
