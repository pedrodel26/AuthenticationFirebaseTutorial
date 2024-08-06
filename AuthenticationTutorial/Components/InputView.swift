//
//  InputView.swift
//  AuthenticationTutorial
//
//  Created by Pedro Delmondes  on 31/07/2024.
//

import SwiftUI

struct InputView: View {
    
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecureField {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
            
            Divider()
        }
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email Adress", placeholder: "pedro@gmail.com")
}
