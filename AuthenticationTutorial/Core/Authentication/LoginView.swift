//
//  LoginView.swift
//  AuthenticationTutorial
//
//  Created by Pedro Delmondes  on 31/07/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("firebase_logo_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.vertical, 32)
            }
            
            VStack(spacing: 22) {
                InputView(text: $email, 
                          title: "Email Adress",
                          placeholder: "pedro@gmail.com")
                .textInputAutocapitalization(.never)
                
                InputView(text: $password,
                          title: "Senha Atual",
                          placeholder: "password",
                          isSecureField: true)
            }
            .padding(.vertical)
            
            Button(action: {
                Task {
                    try await viewModel.signIn(withEmail:email, password: password)
                }
            }, label: {
                HStack {
                    Text("SIGN IN")
                    Image(systemName: "visionpro.and.arrow.forward")
                }
                .frame(width: 360, height: 55)
                .fontWeight(.semibold)
                
            })
            .background(.yellow)
            .cornerRadius(12)
            .padding(.top, 12)
            
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarBackButtonHidden(true) //<- Warning!!
            } label: {
                HStack(spacing: 4) {
                    Text("Não criou sua conta ainda?")
                    Text("Crie ela já!")
                        .fontWeight(.semibold)
                }
                .foregroundStyle(.blue)
            }

        }
        .padding()
    }
}

#Preview {
    LoginView()
}
