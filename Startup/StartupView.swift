//
//  StartupView.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 13/09/24.
//

import SwiftUI

struct StartupView: View {
    
    @State private var txtFieldEmail: String = ""
    @State private var txtFieldPassword: String = ""
    @State private var shouldNavigate: Bool = false
    
    @ObservedObject var vm: StartupViewModel
    @Binding var isLoggedIn: Bool // Binding to track login state
    
    init(vm: StartupViewModel, isLoggedIn: Binding<Bool>) {
        self.vm = vm
        _isLoggedIn = isLoggedIn
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            Image("vivo_logo")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 50)
            
            Spacer()
            
            Text("Welcome back 👋")
                .font(.system(size: 24))
            
            CustomTextField(
                inputText: $txtFieldEmail,
                leadingIcon: "envelope"
            )
            
            CustomTextField(
                inputText: $txtFieldPassword,
                leadingIcon: "lock",
                isSecure: true,
                isValid: vm.isPasswordValid,
                errorMessage: "Invalid password."
            )
            
            Spacer()
            
            Button {
                vm.validateAndLogin(email: txtFieldEmail, password: txtFieldPassword) {
                    withAnimation {
                        isLoggedIn = true
                    }
                }
                
            } label: {
                Text("Log in")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .bold))
                    .frame(maxWidth: .infinity, maxHeight: 58)
                    .background(Color("vivo_purple"))
                    .cornerRadius(16)
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    StartupView(vm: StartupViewModel(authHandler: AuthHandlerImpl()), isLoggedIn: .constant(false))
}
