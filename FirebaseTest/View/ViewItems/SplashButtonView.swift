//
//  f.swift
//  FirebaseTest
//
//  Created by 1 on 14.08.2024.
//

import SwiftUI

struct SplashButtonView: View {
    var label :String
    var action : () -> Void
    var body: some View {
        Button(action: action, label: {
            Text(label)
        })
        .frame(width: UIScreen.main.bounds.width , height: 50)
        .padding(.horizontal , -20)
        .foregroundColor(.black)
        .bold()
        .background(.lightLilac)
        .clipShape(.capsule)
        .fontDesign(.monospaced)
        .fontDesign(.monospaced)
        .padding(12)
    }
}
