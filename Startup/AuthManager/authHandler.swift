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
    func performLogin(email: String, password: String) -> AnyPublisher<AuthState, Error>
}

class AuthHandlerImpl: AuthHandler {
    
    func performLogin(email: String, password: String) -> AnyPublisher<AuthState, Error> {
        // Replace this with your actual login API URL
        let urlString = "https://api.yourdomain.com/login"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Assuming the API expects JSON body with email and password
        let body: [String: String] = [
            "email": email,
            "password": password
        ]
        
        // Serialize the body to JSON data
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
        
        // Perform the network call
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                // Ensure the response is an HTTP response with status code 200
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                // Assuming the API returns a success response like {"status": "success"}
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                
                if let status = json?["status"] as? String, status == "success" {
                    return AuthState.authenticated
                } else {
                    return AuthState.unauthenticated
                }
            }
            .receive(on: DispatchQueue.main) // Handle on main thread
            .eraseToAnyPublisher()
    }
}
