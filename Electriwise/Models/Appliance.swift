//
//  Appliance.swift
//  Electriwise
//
//  Created by David Mahbubi on 22/05/23.
//

import Foundation

struct Appliance: Hashable {
    var name: String
    var wattage: UInt16
    var avgUsage: UInt8
    var iconName: String
    var avgUsageUnit: String
    var avgUsageRepeat: Set<AvgUsageRepeat>
    var qty: UInt16
 }
