//
//  TextFieldCustomStyle.swift
//  FirebaseTest
//
//  Created by 1 on 15.08.2024.
//

import SwiftUI

struct TextFieldCustomStyle: View {
    
    var title: String
    
    @Binding var text: String
    
    @FocusState var isActive
    
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .focused($isActive)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
            
            TextFormatString( label: title)
                .padding(.horizontal)
                .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
                .foregroundStyle(isActive ? .black : .secondary)
                .animation(.spring, value: isActive)
        }.padding(  20)
    }
}
