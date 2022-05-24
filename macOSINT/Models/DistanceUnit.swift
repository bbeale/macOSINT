//
//  DistanceUnit.swift
//  macOSINT
//
//  Created by BLSEC on 5/23/22.
//

import Foundation

enum DistanceUnit: String, Codable, CaseIterable {
    case miles
    case kilometers
}

extension DistanceUnit {
    var title: String {
        switch self {
        case .miles:
            return "mi"
        case .kilometers:
            return "km"
        }
    }
}
