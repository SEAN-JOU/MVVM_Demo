//
//  Double+Ext.swift
//  Chinastockanalysis
//
//  Created by sean on 2021/12/23.
//  Copyright © 2021 Jou Sean. All rights reserved.
//

import Foundation


extension Double {
    
    func floor(toDecimal decimal: Int) -> Double {
        let numberOfDigits = pow(10.0, Double(decimal))
        return (self * numberOfDigits).rounded(.towardZero) / numberOfDigits
    }
    var cleanZero : String {
            return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
        }
    func ceiling(toDecimal decimal: Int) -> Double {
          let numberOfDigits = abs(pow(10.0, Double(decimal)))
          if self.sign == .minus {
              return Double(Int(self * numberOfDigits)) / numberOfDigits
          } else {
              return Double(ceil(self * numberOfDigits)) / numberOfDigits
          }
      }
}
