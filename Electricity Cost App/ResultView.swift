//
//  ResultView.swift
//  Electricity Cost App
//
//  Created by David Mahbubi on 08/05/23.
//

import SwiftUI

struct ResultView: View {
    
    @Binding var appliances: [Appliance]
    
    var body: some View {
        List {
            Section ("Global average cost") {
                HStack {
                    Text("Daily")
                    Spacer()
                    Text("Rp. 50.000")
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Monthly")
                    Spacer()
                    Text("Rp. 50.000")
                        .foregroundColor(.gray)
                }
            }
            Section("Air Conditioner") {
                HStack {
                    Text("Air Conditiner Load")
                    Spacer()
                    Text("200watt")
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Avg. Daily Usage")
                    Spacer()
                    Text("2 Hours / Day")
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Cost per Minutes")
                    Spacer()
                    Text("Rp. 13.000")
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Cost per Hour")
                    Spacer()
                    Text("Rp. 13.000")
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Avg. Daily Cost")
                    Spacer()
                    Text("Rp. 13.000")
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Avg. Monthly Cost")
                    Spacer()
                    Text("Rp. 13.000")
                        .foregroundColor(.gray)
                }
                Button("Customize this Appliance") {
                    
                }
            }
        }
        .navigationTitle("Result")
    }
}

struct ResultView_Previews: PreviewProvider {
    
    @State static private var appliances: [Appliance] = []
    
    static var previews: some View {
        ResultView(appliances: $appliances)
    }
}
