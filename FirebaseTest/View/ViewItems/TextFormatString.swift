//
//  sds.swift
//  FirebaseTest
//
//  Created by 1 on 14.08.2024.
//

import SwiftUI

struct TextFormatString: View {
    var label : String
    var body: some View {
        
        Text(label)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .fontDesign(.monospaced)
            .font(.system(size: 20 , weight: .black))
    }
}
