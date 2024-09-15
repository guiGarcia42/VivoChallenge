//
//  ProfileService.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 15/09/24.
//

import Foundation
import Combine

class ProfileService {
    
    // PassthroughSubject to emit the user data
    var user = PassthroughSubject<UserModel, Never>()
    
    // Simulate a network call to save the user data
    func saveUserData(_ user: UserModel) -> AnyPublisher<Bool, Error> {
        return Future { promise in
            // Simulate a delay for network request
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                // Simulate successful save
                print("User data saved: \(user)")
                promise(.success(true))
            }
        }
        .eraseToAnyPublisher()
    }
    
    // Simulate a network call to fetch the user data
    func fetchUserData() {
        // Simulate a delay for network request
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            DispatchQueue.main.async {
                self.user.send(mockUser)
            }
        }
    }
}
