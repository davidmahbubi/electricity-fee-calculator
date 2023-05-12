//
//  Calculator.swift
//  Electricity Cost App
//
//  Created by David Mahbubi on 04/05/23.
//

import SwiftUI

struct Calculator: View {
    
    @State var appliances: [Appliance] = []
    @State private var electricityRate: String = ""
    @State var showFormModal: Bool = false
    @State var showAlert: Bool = false
    @State var showResult: Int? = nil
    @State var applianceIdx: Int = 0
    @State var isNavigationLinkActive = false
    
    var rowsItem: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack {
            ZStack {    
                RoundedRectangle(cornerRadius: 20, style: .continuous).fill(.blue)
                    .frame(height: 90)
                HStack {
                    TextField("Input electriciy rate", text: $electricityRate)
                        .foregroundColor(.white)
                        .padding()
                        .accentColor(.white)

                    Text("/ KWh")
                        .padding(.trailing)
                        .foregroundColor(.white)
                }
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top)
            ScrollView {
                if $appliances.isEmpty {
                    VStack {
                        Image(systemName: "tray")
                            .font(.system(size: 60))
                            .padding(.bottom, 5)
                            .padding(.top, 40)
                        Text("No Appliances.\n Click \"Add\" button to add one")
                            .multilineTextAlignment(.center)
                    }
                    .padding(.trailing)
                    .padding(.leading)
                } else {
                    LazyVGrid(columns: rowsItem, spacing: 20) {
                        ForEach(0..<$appliances.count, id: \.self) { idx in
                            ApplianceItemCard(
                                applianceName: $appliances[idx].name,
                                wattage: $appliances[idx].wattage,
                                applianceIcon: $appliances[idx].iconName,
                                idx: idx,
                                onDelete: { idx in
                                    appliances.remove(at: idx)
                                }
                            )
                        }
                    }
                        .padding(.trailing)
                        .padding(.leading)
                        .padding(.top)
                }
            }
            NavigationLink {
                    ResultView(appliances: $appliances, electricityRate: $electricityRate)
            } label: {
                Text("Calculate Now")
                  .frame(maxWidth: .infinity)
                  .frame(height: 70)
                  .foregroundColor(.white)
                  .background(electricityRate == "" ? .gray : .blue)
                  .cornerRadius(15)
                  .padding(.top, 25)
                  .padding(.trailing, 20)
                  .padding(.leading, 20)
                                  
            }
            .disabled(electricityRate == "" ? true : false)
        }
        .navigationTitle("Home Appliances")
        .toolbar {
            Button("Add") {
                showFormModal = true
            }
        }
        .sheet(isPresented: $showFormModal) {
            ApplianceForm(appliancesList: $appliances)
        }
        .alert(isPresented: self.$showAlert) {
            Alert(title: Text("Calculation Result"), message: Text(makeSummary()))
        }
    }
    
    func makeSummary() -> String {
        var summaryText: [String] = []
        
        summaryText = appliances.map { appliance in
            return appliance.name
        }
        
        return summaryText.joined(separator: ",")
    }
}

struct Calculator_Previews: PreviewProvider {
    static var previews: some View {
        Calculator(appliances: [Appliance(name: "Testing", wattage: 20, avgUsage: 20, iconName: "stove", avgUsageUnit: .hours_day, avgUsageRepeat: [.sunday, .monday])])
    }
}
