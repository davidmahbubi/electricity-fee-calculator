//
//  Appliance.swift
//  Electricity Cost App
//
//  Created by David Mahbubi on 11/05/23.
//

struct Appliance: Hashable {
    
    var name: String
    var wattage: UInt16
    var avgUsage: UInt8
    var iconName: String
    var avgUsageUnit: AvgUsageType
    var avgUsageRepeat: Set<AvgUsageRepeat>
    
    func countCostPerHour(electricityRate: UInt) -> Float {
        let result: Float = Float(self.wattage) / 1000 * Float(electricityRate)
        return result
    }
    
    func countCostPerMinute(electricityRate: UInt) -> Float {
        return countCostPerHour(electricityRate: electricityRate) / 60
    }
    
    func countCostPerDay(electricityRate: UInt) -> Float {
        let usageInDay: Float = avgUsageUnit == .minutes_day ? Float(avgUsage) / Float(60) : Float(avgUsage)
        return countCostPerHour(electricityRate: electricityRate) * usageInDay
    }
    
    func countCostPerMonth(electricityRate: UInt) -> Float {
        let usageInMonth: Float = Float(avgUsageRepeat.count) * Float(4)
        return countCostPerDay(electricityRate: electricityRate) * usageInMonth
    }
}
