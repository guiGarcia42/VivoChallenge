//
//  CustomTextField.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 13/09/24.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var inputText: String
    var leadingIcon: String
    var isSecure: Bool
    var isValid: Bool
    var errorMessage: String?
    
    @State private var showPassword: Bool = false
    
    init(inputText: Binding<String>, leadingIcon: String, isSecure: Bool = false, isValid: Bool = true, errorMessage: String? = nil) {
        self._inputText = inputText
        self.leadingIcon = leadingIcon
        self.isSecure = isSecure
        self.isValid = isValid
        self.errorMessage = errorMessage
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 16) {
                
                Image(systemName: leadingIcon)
                    .bold()
                    .frame(width: 24, height: 24)
                
                if isSecure && !showPassword {
                    SecureField("", text: $inputText)
                        .font(.system(size: 16))
                } else {
                    TextField("", text: $inputText)
                        .font(.system(size: 16))
                }
                
                if isSecure {
                    Button(action: {
                        self.showPassword.toggle()
                    }) {
                        Image(systemName: showPassword
                              ? "eye.slash"
                              : "eye")
                        .bold()
                        .frame(width: 24, height: 24)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .foregroundColor(.white)
            .background(Color("vivo_purple"))
            .cornerRadius(16)
            .overlay(RoundedRectangle(cornerRadius: 16)
                .stroke(isValid ? .clear : Color("alert_color"), lineWidth: 1))
            
            if !isValid, let errorMessage = errorMessage {
                HStack(spacing: 4) {
                    Image("error")
                    
                    Text(errorMessage)
                        .foregroundColor(Color("alert_color"))
                        .font(.system(size: 12))
                        
                }
                .padding(.leading, 8)
                .padding(.top, 4)
            }
        }
    }
}
