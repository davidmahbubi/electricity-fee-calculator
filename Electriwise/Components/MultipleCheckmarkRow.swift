//
//  MultipleCheckmarkRow.swift
//  Electricity Cost App
//
//  Created by David Mahbubi on 11/05/23.
//

import SwiftUI

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
                    Image(systemName: "checkmark").foregroundColor(.blue)
                }
            }
        }
    }
}


struct MultipleCheckmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        MultipleCheckmarkRow(title: "Sunday", isSelected: true) {
            
        }
    }
}
