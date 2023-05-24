//
//  OnboardingView.swift
//  Electriwise
//
//  Created by David Mahbubi on 15/05/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("isOnboardingSkipped") var isOnboardingSkipped: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("ElectriWise")
                .font(.largeTitle)
                .padding(.bottom, 40)
                .fontWeight(.bold)
            Image("primary_logo")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding(.bottom, 20)
            Text("onboardingHeadline")
                .multilineTextAlignment(.center)
                .frame(maxWidth: 300)
            Spacer()
            Button("getStarted") {
                isOnboardingSkipped = true
            }
                .frame(width: 300, height: 70)
                .background(Color.blue)
                .cornerRadius(15)
                .padding(.top, 25)
                .foregroundColor(.white)
        }
        .padding()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
