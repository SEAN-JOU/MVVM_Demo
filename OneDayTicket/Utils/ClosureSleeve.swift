//
//  ClosureSleeve.swift
//  Chinastockanalysis
//
//  Created by SrayTech Co on 2022/8/26.
//  Copyright © 2022 Jou Sean. All rights reserved.
//

import UIKit

class ClosureSleeve {
  var closure: () -> ()

  init(attachTo: AnyObject, closure: @escaping () -> ()) {
    self.closure = closure
    objc_setAssociatedObject(attachTo, "[\(arc4random())]", self, .OBJC_ASSOCIATION_RETAIN)
  }

  @objc func invoke() {
    closure()
  }
}

extension UIControl {
    func setOnClickListener(for controlEvents: UIControl.Event = .primaryActionTriggered, action: @escaping () -> ()) {
        addTarget(ClosureSleeve(attachTo: self, closure: action), action: #selector(ClosureSleeve.invoke), for: controlEvents)
    }
}
