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

struct RepeatView: View {
    
    let allowedRepeatCycles = ["Every Sunday", "Every Monday", "Every Tuesday", "Every Wednesday", "Every Thursday", "Every Friday", "Every Saturday"]
    
    @Binding var selectedItems: Set<AvgUsageRepeat>
    
    var body: some View {
        List {
            Section(header: Text("Quick Select")) {
                Button("Every Weekdays") {
                    
                }
                Button("Every Weekend") {
                    
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

struct MultipleCheckmarkRow: View {
    
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

struct RepeatView_Previews: PreviewProvider {
    
    @State private static var selectedAvgUsageRepeat: Set<AvgUsageRepeat> = []
    
    static var previews: some View {
        RepeatView(selectedItems: $selectedAvgUsageRepeat)
    }
}
