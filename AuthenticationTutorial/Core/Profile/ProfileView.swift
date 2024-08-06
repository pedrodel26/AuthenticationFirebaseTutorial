//
//  ProfileView.swift
//  AuthenticationTutorial
//
//  Created by Pedro Delmondes  on 01/08/2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
            List {
                Section {
                    HStack {
                        Text(User.MOCK_USER.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.orange)
                            .frame(width: 80, height: 80)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(User.MOCK_USER.fullname)
                                .font(.title2)
                                .foregroundStyle(.black)
                            
                            Text(User.MOCK_USER.email)
                                .font(.footnote)
                                .foregroundStyle(Color(.systemGray))
                        }
                        
                    }
                }
                
                Section("General") {
                    HStack(spacing: 12) {
                        SettingsRowView(imageName: "gearshape.fill",
                                        title: "Version",
                                        tintColor: Color(.systemGray))
                        
                        Spacer()
                        
                        Text("FREE")
                            .foregroundStyle(Color(.systemGreen))
                    }
                }
                
                Section("Account") {
                    
                    Button(action: {
                        viewModel.signOut()
                    }, label: {
                        SettingsRowView(imageName: "signpost.left.fill",
                                        title: "Sign Out",
                                        tintColor: Color(.red))
                    })
                    
                    
                    Button(action: {
                        print("deleting account noooo!")
                    }, label: {
                        SettingsRowView(imageName: "xmark.circle.fill",
                                        title: "Delete Account",
                                        tintColor: Color(.red))
                    })
                }
            }
        
    }
}


#Preview {
    ProfileView()
}
