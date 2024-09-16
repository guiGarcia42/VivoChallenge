//
//  authHandler.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 13/09/24.
//

import Foundation
import Combine

enum AuthState {
    case authenticated
    case unauthenticated
}

protocol AuthHandler {
    func performLogin(phone: String, password: String) -> AnyPublisher<AuthState, Error>
}

class AuthHandlerImpl: AuthHandler {
    
    func performLogin(phone: String, password: String) -> AnyPublisher<AuthState, Error> {
            return Future<AuthState, Error> { promise in
                // Simulate authentication with the mock user
                if phone == mockUser.phone && password == mockUser.password {
                    promise(.success(.authenticated))
                } else {
                    promise(.success(.unauthenticated))
                }
            }
            .eraseToAnyPublisher()
        }
}
