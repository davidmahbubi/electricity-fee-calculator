//
//  ResultView.swift
//  Electricity Cost App
//
//  Created by David Mahbubi on 08/05/23.
//

import SwiftUI

struct ResultView: View {
    
    @Binding var appliances: [Appliance]
    @Binding var electricityRate: String
    
    var body: some View {
        List {
            Section ("Global average cost") {
                HStack {
                    Text("Daily")
                    Spacer()
                    Text(formatCurrencyNumber(number: appliances.map{ $0.countCostPerDay(electricityRate: UInt(electricityRate)!) }.reduce(0, +)))
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Monthly")
                    Spacer()
                    Text(formatCurrencyNumber(number: appliances.map{ $0.countCostPerMonth(electricityRate: UInt(electricityRate)!) }.reduce(0, +)))
                        .foregroundColor(.gray)
                }
            }
            ForEach(appliances, id: \.self) { appliance in
                Section(appliance.name) {
                    HStack {
                        Text("\(appliance.name) Load")
                        Spacer()
                        Text("\(appliance.wattage) watt")
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Avg. Daily Usage")
                        Spacer()
                        Text("\(appliance.avgUsage) \(appliance.avgUsageUnit.rawValue)")
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Cost per Minutes")
                        Spacer()
                        Text(
                            formatCurrencyNumber(number: appliance.countCostPerMinute(electricityRate: UInt(electricityRate)!))
                        )
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Cost per Hour")
                        Spacer()
                        Text(formatCurrencyNumber(number: appliance.countCostPerHour(electricityRate: UInt(electricityRate)!)))
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Avg. Daily Cost")
                        Spacer()
                        Text(formatCurrencyNumber(number: appliance.countCostPerDay(electricityRate: UInt(electricityRate)!)))
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Avg. Monthly Cost")
                        Spacer()
                        Text(formatCurrencyNumber(number: appliance.countCostPerMonth(electricityRate: UInt(electricityRate)!)))
                            .foregroundColor(.gray)
                    }
                    Button("Customize this Appliance") {
                        
                    }
                }
            }
        }
        .navigationTitle("Result")
    }
    
    func formatCurrencyNumber(number: Float) -> String {
        let formatter = NumberFormatter()
        
        formatter.currencySymbol = "Rp. "
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "id_ID")
        
        return formatter.string(from: NSNumber(value: number))!
    }
}

struct ResultView_Previews: PreviewProvider {
    
    @State static private var appliances: [Appliance] = []
    @State static private var electricityRate: String = ""
    
    static var previews: some View {
        ResultView(appliances: $appliances, electricityRate: $electricityRate)
    }
}
