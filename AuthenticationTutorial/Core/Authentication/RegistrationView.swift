//
//  RegistrationView.swift
//  AuthenticationTutorial
//
//  Created by Pedro Delmondes  on 01/08/2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        NavigationStack {
            Image("firebase_logo_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding(.vertical, 32)
            
            VStack(spacing: 22) {
                InputView(text: $email,
                          title: "Email Adress",
                          placeholder: "pedro@gmail.com")
                .textInputAutocapitalization(.never)
                
                InputView(text: $fullName,
                          title: "Full Name",
                          placeholder: "Pedro Delmondes")
                
                
                InputView(text: $password,
                          title: "Senha Atual",
                          placeholder: "Password",
                          isSecureField: true)
                
                InputView(text: $password,
                          title: "Confirme Senha",
                          placeholder: "Confirmar senhar",
                          isSecureField: true)
            }
            .padding(.vertical)
            
             
            Button(action: {
                Task {
                    try await viewModel.createUser(withEmail: email,
                                                   password: password,
                                                   fullname: fullName)
                }
            }, label: {
                HStack {
                    Text("SIGN UP")
                    Image(systemName: "visionpro.and.arrow.forward")
                }
                .frame(width: 360, height: 55)
                .fontWeight(.semibold)
                
            })
            .background(.yellow)
            .cornerRadius(12)
            .padding(.top, 2)
            
            Spacer()
            
            Button(action: {
                dismiss()
            }, label: {
                HStack(spacing: 4) {
                    Text("Já tem conta criada?")
                    Text("Entre por aqui!")
                        .fontWeight(.semibold)
                }
                .foregroundStyle(.blue)
            })
        }
        .padding(.horizontal)
    }
}

#Preview {
    RegistrationView()
}
