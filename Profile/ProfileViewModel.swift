//
//  ProfileViewModel.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 15/09/24.
//

import Foundation
import Combine
import SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published var user: UserModel
    @Published var isEditing: Bool = false // Track if we're in edit mode
    @Published var isSaving: Bool = false  // Track saving state
    
    private var service: ProfileService
    private var cancellable = Set<AnyCancellable>()
    
    init(service: ProfileService) {
        self.service = service
        self.user = UserModel(fullName: "", cpf: "", phone: "", email: "", address: "")
        bind()
        fetchUserData()
    }
    
    // Bind to the service's PassthroughSubject to listen for user updates
    private func bind() {
        service.user
            .receive(on: DispatchQueue.main)
            .sink { [weak self] userData in
                self?.user = userData
            }
            .store(in: &cancellable)
    }
    
    // Call the service to fetch the user data
    func fetchUserData() {
        service.fetchUserData()
    }
    
    // Handle saving changes
    func saveChanges() {
        isSaving = true
        
        // Call the service to save user data and handle the result
        service.saveUserData(user)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isSaving = false
                switch completion {
                case .failure(let error):
                    print("Failed to save user data: \(error)")
                case .finished:
                    self?.isEditing = false // Exit edit mode after saving
                }
            }, receiveValue: { _ in })
            .store(in: &cancellable)
    }
    
    // Toggle editing mode
    func toggleEditing() {
        isEditing.toggle() // Toggle between editing and saving modes
    }
    
    // Handle logout and reset user data
    func logout(isLoggedIn: Binding<Bool>) {
        // Reset user data
        self.user = UserModel(fullName: "", cpf: "", phone: "", email: "", address: "")
        // Trigger logout and set isLoggedIn to false
        isLoggedIn.wrappedValue = false
    }
}
