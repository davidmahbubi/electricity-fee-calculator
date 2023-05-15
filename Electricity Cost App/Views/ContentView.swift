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
                Text("ElectriWise")
                    .font(.largeTitle)
                Image("primary_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding(.bottom, 20)
                Text("Empowering You to Track and Control Your Electric Bill")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 300)
                Spacer()
                NavigationLink(destination: Calculator()) {
                    Text("Calculate my Electricity")
                        .foregroundColor(.white)
                }
                .frame(width: 300, height: 70)
                .background(Color.blue)
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
