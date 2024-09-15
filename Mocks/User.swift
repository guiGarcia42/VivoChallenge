//
//  User.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 15/09/24.
//

import Foundation

public struct UserModel {
    var fullName: String
    var cpf: String
    var phone: String
    var email: String
    var address: String
}

public var mockUser = UserModel(
    fullName: "Guilherme Garcia Silveira",
    cpf: "512.767.708.39",
    phone: "11 97262-2224",
    email: "gui123.garcia@gmail.com",
    address: "Rua Capitão Luis Ramos, 342"
)
