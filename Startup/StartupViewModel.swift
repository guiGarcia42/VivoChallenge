//
//  StartupViewModel.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 13/09/24.
//

import Foundation
import Combine

class StartupViewModel: ObservableObject {
    
    @Published var isPasswordValid: Bool = true
    private var cancellables = Set<AnyCancellable>() // To store the Combine subscriptions
    
    var authHandler: AuthHandler
    
    init(authHandler: AuthHandler) {
        self.authHandler = authHandler
    }
    
    // Login user and handle result using Combine
    func loginUser(phone: String, password: String, completionHandler: @escaping(Result<Void, Error>) -> Void) {
        authHandler.performLogin(phone: phone, password: password)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break // No error, operation finished
                case .failure(let error):
                    DispatchQueue.main.async {
                        completionHandler(.failure(error)) // Pass the error to the completion handler
                    }
                }
            }, receiveValue: { authState in
                switch authState {
                case .authenticated:
                    DispatchQueue.main.async {
                        completionHandler(.success(())) // If authenticated, return success
                    }
                case .unauthenticated:
                    DispatchQueue.main.async {
                        completionHandler(.failure(URLError(.userAuthenticationRequired))) // Handle unauthenticated state
                    }
                }
            })
            .store(in: &cancellables) // Store the subscription
    }
    
    func validateAndLogin(phone: String, password: String, onLoginSuccess: @escaping () -> Void) {
        // Validate the phone and password fields
        let isPhoneValid = !phone.isEmpty && phone.count >= 10 // Basic phone validation (assuming 10+ digits)
        isPasswordValid = !password.isEmpty && password.count >= 6 // Password must be at least 6 characters
        
        // Proceed if both validations are successful
        if isPhoneValid && isPasswordValid {
            loginUser(phone: phone, password: password) { result in
                switch result {
                case .success:
                    DispatchQueue.main.async {
                        onLoginSuccess() // Trigger login success callback
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.isPasswordValid = false // Set password validity to false on failure
                        print("Login failed with error: \(error.localizedDescription)") // Optional error logging
                    }
                }
            }
        } else {
            // If validation fails, update password validity or other validation-related UI
            DispatchQueue.main.async {
                self.isPasswordValid = false
            }
        }
    }
}
