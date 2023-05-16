//
//  ApplianceItemCard.swift
//  Electricity Cost App
//
//  Created by David Mahbubi on 06/05/23.
//

import SwiftUI

struct ApplianceItemCard: View {
    
    var applianceName: String
    var wattage: UInt16
    var applianceIcon: String
    
    var idx: Int
    
    var onDelete: ((_ idx: Int) -> Void)?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.blue)
            VStack(alignment: .leading) {
                ZStack {
                    Circle()
                        .frame(width: 65)
                        .foregroundColor(.white)
                    Image(systemName: applianceIcon)
                        .font(.system(size: 30))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .foregroundColor(.blue)
                }
                Text(applianceName)
                    .foregroundColor(.white)
                    .font(.title3)
                    .padding(.bottom, 0.1)
                    .padding(.top, 20)
                Text("\(wattage)watt")
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .contextMenu(ContextMenu(menuItems: {
            Button(action: {
                
            }) {
                Text("Edit")
                Image(systemName: "pencil")
            }
            Button(action: {
                if (onDelete != nil) {
                    onDelete!(self.idx)
                }
            }) {
                Text("Delete")
                    .foregroundColor(.red)
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }))
    }
}

struct ApplianceItemCard_Previews: PreviewProvider {
    
    static var prevName: String = "Testing"
    static var wattage: UInt16 = 80
    static var applianceIcon: String = "stove"
    static var idx: Int = 0
    
    static var previews: some View {
        ApplianceItemCard(applianceName: prevName, wattage: wattage, applianceIcon: applianceIcon, idx: idx)
    }
}
