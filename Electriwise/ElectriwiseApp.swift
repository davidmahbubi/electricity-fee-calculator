//
//  Electricity_Cost_AppApp.swift
//  Electricity Cost App
//
//  Created by David Mahbubi on 04/05/23.
//

import SwiftUI

@main
struct ElectriwiseApp: App {
    
    @AppStorage("isOnboardingSkipped") var isOnboardingSkipped: Bool = false
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            if isOnboardingSkipped {
                ContentView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
            } else {
                OnboardingView()
            }
        }
    }
}
