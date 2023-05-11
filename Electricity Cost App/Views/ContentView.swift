//
//  ContentView.swift
//  Electricity Cost App
//
//  Created by David Mahbubi on 04/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Electricity Calculator")
                    .font(.largeTitle)
                Image("main_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Spacer()
                NavigationLink(destination: Calculator()) {
                    Text("Count my Electricity")
                        .foregroundColor(.white)
                }
                .frame(width: 300, height: 70)
                .background(.blue)
                .cornerRadius(15)
                .padding(.top, 25)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
