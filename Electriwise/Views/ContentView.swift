//
//  ContentView.swift
//  Electricity Cost App
//
//  Created by David Mahbubi on 04/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            CalculatorView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
