//
//  ApplianceForm.swift
//  Electricity Cost App
//
//  Created by David Mahbubi on 05/05/23.
//

import SwiftUI
import Combine

//enum AvgUsageTypes: String, CaseIterable, Identifiable {
//    case minutes_day = "Minutes / Day"
//    case hours_day = "Hours / Day"
//
//    var id: RawValue {
//        self.rawValue
//    }
//}

struct ApplianceForm: SwiftUI.View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjContext
    
    @AppStorage("StoredAppliancesList") var storedAppliances: String = ""
    
    @State private var name: String = ""
    @State private var wattage: String = ""
    @State private var averageUsage: String = ""
    @State private var selectedAverageUsageUnit: String = AvgUsageTypes[0]
    @State private var selectedIconIndex: Int = 0
    @State private var isInverter: Bool = false
    @State private var selectedAvgUsageRepeat: Set<AvgUsageRepeat> = [.sunday, .monday, .tuesday, .wednesday, .thursday, .friday, .saturday]
    @State private var isInvalidAlertPresented: Bool = false
    
    @Binding var appliancesList: [Appliance]
    
    let iconColumnsLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let defaults = UserDefaults.standard
    let availableIcons = ["pc", "air.conditioner.horizontal", "stove", "lamp.floor", "washer", "gamecontroller", "tv", "hifispeaker" , "cup.and.saucer", "bolt.car" , "iphone.gen1", "fan.floor"]
    
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
                            .onReceive(Just(wattage)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    wattage = filtered
                                }
                            }
                        Text("Watt")
                    }
                }
                Section(header: Text("Usage")) {
                    HStack {
                        TextField("Average Usage", text: $averageUsage)
                            .keyboardType(.numberPad)
                            .onReceive(Just(averageUsage)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    averageUsage = filtered
                                }
                            }
                        Picker("", selection: $selectedAverageUsageUnit) {
                            ForEach(AvgUsageTypes, id: \.self) { avgUsageType in
                                Text(avgUsageType)
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
                        if isFormValid() {
                            let appliance: Appliance = Appliance(name: name, wattage: UInt16(wattage)!, avgUsage: UInt8(averageUsage)!, iconName: availableIcons[selectedIconIndex], avgUsageUnit: selectedAverageUsageUnit, avgUsageRepeat: selectedAvgUsageRepeat)
                            persistData(appliance)
                            appliancesList.append(appliance)
                            self.presentationMode.wrappedValue.dismiss()
                        } else {
                            isInvalidAlertPresented = true
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .alert(isPresented: $isInvalidAlertPresented) {
                Alert(title: Text("Form Incomplete"), message: Text("All fields should be filled!"))
            }
        }
        .navigationTitle("Hello world")
    }
    
    func isFormValid() -> Bool { !name.isEmpty && !wattage.isEmpty && !averageUsage.isEmpty }
    
    func persistData(_ appliance: Appliance) -> Void {
        DataController().addAppliance(appliance, context: managedObjContext)
    }
}

struct ApplianceForm_Previews: PreviewProvider {
    @State static var appliances: [Appliance] = []
    static var previews: some SwiftUI.View {
        ApplianceForm(appliancesList: $appliances)
    }
}
