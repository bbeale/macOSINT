//
//  DistanceFormatter.swift
//  macOSINT
//
//  Created by BLSEC on 5/23/22.
//

import Foundation

class DistanceFormatter {
    var unitOptions: DistanceUnit = .miles
    
    func format(distInMeters: Double) -> String {
        switch unitOptions {
        case .miles:
            return formatForMiles(distInMeters: distInMeters)
        case .kilometers:
            return formatForKilometers(distInMeters: distInMeters)
        }
    }
    
    private func formatForMiles(distInMeters: Double) -> String {
        switch distInMeters {
            case 0...182:
                return distInMeters.toFeet().displayDistance(.feet)
            case 183...:
                return distInMeters.toMiles().displayDistance(.miles)
            default:
                return distInMeters.toFeet().displayDistance(.feet)
        }
    }
    
    private func formatForKilometers(distInMeters: Double) -> String {
        switch distInMeters {
            case 0...900:
                return distInMeters.toMeters().displayDistance(.meters)
            case 901...:
                return distInMeters.toKms().displayDistance(.kilometers)
            default:
                return distInMeters.toMeters().displayDistance(.meters)
        }
    }
}
