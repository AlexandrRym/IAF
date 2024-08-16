//
//  RoundedText.swift
//  FirebaseTest
//
//  Created by 1 on 15.08.2024.
//

import SwiftUI

struct RoundedText: View {
    
    var label :String
    
    var body: some View {
        Text(label)
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
