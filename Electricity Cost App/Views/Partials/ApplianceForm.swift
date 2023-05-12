//
//  ApplianceForm.swift
//  Electricity Cost App
//
//  Created by David Mahbubi on 05/05/23.
//

import SwiftUI

enum InputMode {
    case WATTAGE
    case VOLTS_AMP
}

enum AvgUsageType: String, CaseIterable, Identifiable {
    case minutes_day = "Minutes / Day"
    case hours_day = "Hours / Day"
    
    var id: RawValue {
        self.rawValue
    }
}

struct ApplianceForm: SwiftUI.View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var wattage: String = ""
    @State private var averageUsage: String = ""
    @State private var selectedAverageUsageUnit: AvgUsageType = .hours_day
    @State private var selectedIconIndex: Int = 0
    @State private var isInverter: Bool = false
    @State private var selectedAvgUsageRepeat: Set<AvgUsageRepeat> = []
    
    @Binding var appliancesList: [Appliance]
    
    let iconColumnsLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let defaults = UserDefaults.standard
    let availableIcons = ["air.conditioner.horizontal", "stove", "lamp.floor", "washer"]
    
    var body: some SwiftUI.View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    TextField("Name", text: $name)
                }
                Section(header: Text("Electrical Information")) {
                    HStack {
                        TextField("Wattage", text: $wattage)
                            .keyboardType(.numberPad)
                        Text("Watt")
                    }
                    Toggle("Inverter Device", isOn: $isInverter)
                }
                Section(header: Text("Usage")) {
                    HStack {
                        TextField("Average Usage", text: $averageUsage)
                            .keyboardType(.numberPad)
                        Picker("", selection: $selectedAverageUsageUnit) {
                            ForEach(AvgUsageType.allCases) { list in
                                Text(list.rawValue).tag(list)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    NavigationLink(destination: RepeatView(selectedItems: $selectedAvgUsageRepeat)) {
                        Text("Repeat Every")
                    }
                }
                Section(header: Text("Icon")) {
                    ScrollView {
                        LazyVGrid(columns: iconColumnsLayout) {
                            ForEach(0..<availableIcons.count, id: \.self) { idx in
                                Button(action: {
                                    selectedIconIndex = idx
                                }) {
                                    Image(systemName: availableIcons[idx])
                                        .font(.system(size: 50))
                                        .padding()
                                        .foregroundColor(idx == selectedIconIndex ? .blue : .gray)
                                }
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        print(wattage)
                        let appliance: Appliance = Appliance(name: name, wattage: UInt16(wattage)!, avgUsage: UInt8(averageUsage)!, iconName: availableIcons[selectedIconIndex], avgUsageUnit: selectedAverageUsageUnit, avgUsageRepeat: selectedAvgUsageRepeat)
                        appliancesList.append(appliance)
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .onAppear {
                
            }
        }
    }
}

struct ApplianceForm_Previews: PreviewProvider {
    @State static var appliances: [Appliance] = []
    static var previews: some SwiftUI.View {
        ApplianceForm(appliancesList: $appliances)
    }
}
