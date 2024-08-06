//
//  SettingsRowView.swift
//  AuthenticationTutorial
//
//  Created by Pedro Delmondes  on 02/08/2024.
//

import SwiftUI

struct SettingsRowView: View {
    
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundStyle(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.black)
            
            
        }
    }
}

#Preview {
    SettingsRowView(imageName: "pencil", title: "Title", tintColor: Color(.systemGray))
}
