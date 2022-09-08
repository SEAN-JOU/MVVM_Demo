//
//  UIDatePicker+Ext.swift
//  Chinastockanalysis
//
//  Created by sean on 2021/12/29.
//  Copyright © 2021 Jou Sean. All rights reserved.
//

import UIKit

extension UIDatePicker {

   func setDate(from string: String, format: String, animated: Bool = true) {

      let formater = DateFormatter()

      formater.dateFormat = format

      let date = formater.date(from: string) ?? Date()

      setDate(date, animated: animated)
   }
}
