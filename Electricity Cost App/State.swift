//
//  State.swift
//  Electricity Cost App
//
//  Created by David Mahbubi on 05/05/23.
//

import SwiftUI

// Models
struct Appliance: Hashable {
    var name: String
    var wattage: UInt8
    var avgUsage: UInt8
    var iconName: String
    var avgUsageUnit: AvgUsageType
}

enum avgUsageRepeat: String, CaseIterable, Identifiable {
    case sunday = "Every Sunday"
    case monday = "Every Monday"
    case tuesday = "Every Tuesday"
    case wednesday = "Every Wednesday"
    case thursday = "Every Thursday"
    case friday = "Every Friday"
    case saturday = "Every Saturday"
    
    var id: RawValue {
        self.rawValue
    }
}

enum AvgUsageType: String, CaseIterable, Identifiable {
    case minutes_day = "Minutes / Day"
    case hours_day = "Hours / Day"
    
    var id: RawValue {
        self.rawValue
    }
}
