//
//  RoutePopover.swift
//  macOSINT
//
//  Created by BLSEC on 5/23/22.
//

import Foundation
import AppKit

class RoutePopover: NSPopover {
    init(controller: RouteContentViewController) {
        super.init()
        self.contentViewController = controller
        self.contentSize = controller.view.frame.size
        self.behavior = .transient
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
