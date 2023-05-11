//
//  RepeatView.swift
//  Electricity Cost App
//
//  Created by David Mahbubi on 10/05/23.
//

import SwiftUI

struct RepeatView: View {
    
    let allowedRepeatCycles = ["Every Sunday", "Every Monday", "Every Tuesday", "Every Wednesday", "Every Thursday", "Every Friday", "Every Saturday"]
    
    @State private var selectedItems: Set<String> = []
    
    var body: some View {
        List {
            Section(header: Text("Quick Select")) {
                Button("Every Weekdays") {
                    
                }
                Button("Every Weekend") {
                    
                }
            }
            Section(header: Text("Single Select")) {
                ForEach(allowedRepeatCycles, id: \.self) { item in
                    MultipleCheckmarkRow(title: item, isSelected: selectedItems.contains(item)) {
                        if selectedItems.contains(item) {
                            selectedItems.remove(item)
                        } else {
                            selectedItems.insert(item)
                        }
                    }
                }
            }
        }
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
    static var previews: some View {
        RepeatView()
    }
}
