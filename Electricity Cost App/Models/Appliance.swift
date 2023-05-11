//
//  Appliance.swift
//  Electricity Cost App
//
//  Created by David Mahbubi on 11/05/23.
//

struct Appliance: Hashable {
    var name: String
    var wattage: UInt8
    var avgUsage: UInt8
    var iconName: String
    var avgUsageUnit: AvgUsageType
    var avgUsageRepeat: Set<AvgUsageRepeat>
}
