//
//  RepeatView.swift
//  Electricity Cost App
//
//  Created by David Mahbubi on 10/05/23.
//

import SwiftUI

enum AvgUsageRepeat: String, CaseIterable, Identifiable {
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

let repeatEveryWeekendValue: Set<AvgUsageRepeat> = [.saturday, .sunday]
let repeatEveryWeekdaysValue: Set<AvgUsageRepeat> = [.monday, .tuesday, .wednesday, .thursday, .friday]

struct RepeatView: View {
    
    let allowedRepeatCycles = ["Every Sunday", "Every Monday", "Every Tuesday", "Every Wednesday", "Every Thursday", "Every Friday", "Every Saturday"]
    
    @Binding var selectedItems: Set<AvgUsageRepeat>
    
    var body: some View {
        List {
            Section(header: Text("Quick Select")) {
                Button("Everyday") {
                    selectedItems = Set<AvgUsageRepeat>.init(AvgUsageRepeat.allCases)
                }
                Button("Every Weekdays") {
                    selectedItems = repeatEveryWeekdaysValue
                }
                Button("Every Weekend") {
                    selectedItems = repeatEveryWeekendValue
                }
            }
            Section(header: Text("Single Select")) {
                ForEach(AvgUsageRepeat.allCases, id: \.self) { item in
                    MultipleCheckmarkRow(title: item.rawValue, isSelected: selectedItems.contains(item.self), action: {
                        if selectedItems.contains(item.self) {
                            selectedItems.remove(item.self)
                        } else {
                            selectedItems.insert(item.self)
                        }
                    })
                }
            }        }
        .navigationTitle("Repeat")
    }
}

struct RepeatView_Previews: PreviewProvider {
    
    @State private static var selectedAvgUsageRepeat: Set<AvgUsageRepeat> = []
    
    static var previews: some View {
        RepeatView(selectedItems: $selectedAvgUsageRepeat)
    }
}
