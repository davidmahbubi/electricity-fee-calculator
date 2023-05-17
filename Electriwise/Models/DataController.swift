//
//  DataController.swift
//  Electriwise
//
//  Created by David Mahbubi on 16/05/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "ApplianceModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("There's error when processing a data: \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            print("We could not save the data!")
        }
    }
    
    func addAppliance(_ applianceObj: Appliance, context: NSManagedObjectContext) {
        let appliance = Appliances(context: context)
        appliance.id = UUID()
        appliance.name = applianceObj.name
        appliance.wattage = Int16(applianceObj.wattage)
        appliance.icon_name = applianceObj.iconName
        appliance.avg_usage = Int16(applianceObj.avgUsage)
        appliance.avg_usage_unit = applianceObj.avgUsageUnit
        appliance.avg_usage_repeat = applianceObj.avgUsageRepeat.map { avgUsageRepeat in
            avgUsageRepeat.rawValue
        }.joined(separator: ", ")
        save(context: context)
    }
}
