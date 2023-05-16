//
//  Electricity_Cost_AppApp.swift
//  Electricity Cost App
//
//  Created by David Mahbubi on 04/05/23.
//

import SwiftUI

@main
struct ElectriwiseApp: App {
    
    @StateObject private var dataController = DataController()
    @AppStorage("isOnboardingSkipped") var isOnboardingSkipped: Bool = false
    
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
