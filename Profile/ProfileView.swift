//
//  ProfileView.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 13/09/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var vm: ProfileViewModel
        @Binding var isLoggedIn: Bool // Binding to track login state

        init(vm: ProfileViewModel, isLoggedIn: Binding<Bool>) {
            _vm = StateObject(wrappedValue: vm)
            _isLoggedIn = isLoggedIn
        }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 20) {
                
                Image("vivo_icon")
                    .resizable()
                    .frame(width: 23, height: 31)
                    .scaledToFit()
                
                Text("Informações pessoais")
                    .font(.system(size: 18))
                    .padding(.vertical, 20)
                
                Spacer()
                
                Button {
                    withAnimation {
                        vm.logout(isLoggedIn: $isLoggedIn)
                    }
                    
                } label: {
                    HStack {
                        Text("Sair")
                        Image(systemName: "arrow.uturn.left")
                    }
                    .foregroundColor(.red)
                    .padding(8)
                    .background(Color.red.opacity(0.2))
                    .cornerRadius(14)
                }
            }
            .padding(.bottom, 20)
            
            Text("Aqui estão seus dados. Essas são as informações que vamos usar para entrar em contato com você, então tenha certeza de que tudo esteja atualizado.")
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(.bottom, 40)
            
            Group {
                ProfileInfoRow(title: "Nome Completo", value: vm.user.fullName)
                ProfileInfoRow(title: "CPF", value: vm.user.cpf)
                ProfileInfoRow(title: "Telefone", value: vm.user.phone)
                
                if vm.isEditing {
                    EditableProfileInfoRow(title: "Email", value: $vm.user.email)
                    EditableProfileInfoRow(title: "Endereço", value: $vm.user.address)
                } else {
                    ProfileInfoRow(title: "Email", value: vm.user.email)
                    ProfileInfoRow(title: "Endereço", value: vm.user.address)
                }
            }
            
            Spacer()
            
            if vm.isSaving {
                HStack {
                    Spacer()
                    
                    ProgressView("Salvando dados...") // Show saving indicator
                    
                    Spacer()
                }
            } else {
                Button {
                    if vm.isEditing {
                        vm.saveChanges() // Save the data
                    } else {
                        vm.toggleEditing() // Enable edit mode
                    }
                } label: {
                    HStack {
                        Spacer()
                        Text(vm.isEditing ? "Salvar dados" : "Editar dados")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .lineLimit(1)
                            .padding(.vertical, 16)
                        
                        Image(systemName: vm.isEditing ? "checkmark" : "square.and.pencil")
                        Spacer()
                    }
                    .bold()
                    .foregroundColor(.white)
                }
                .background(Color("vivo_purple"))
                .cornerRadius(16)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct ProfileInfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 16))
            Text(value)
                .font(.system(size: 14))
                .foregroundColor(.gray)
            Divider()
        }
    }
}

struct EditableProfileInfoRow: View {
    let title: String
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 16))
            TextField("Enter \(title.lowercased())", text: $value)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.system(size: 14))
            Divider()
        }
    }
}
struct ProfileViewPreviews: PreviewProvider {
    static var previews: some View {
        ProfileView(vm: ProfileViewModel(service: ProfileService()), isLoggedIn: .constant(true))
    }
}
