//
//  User.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 15/09/24.
//

public struct UserModel {
    var fullName: String
    var cpf: String
    var phone: String
    var email: String
    var address: String
    var password: String
}

public var mockUser = UserModel(
    fullName: "Guilherme Garcia Silveira",
    cpf: "512.767.708.39",
    phone: "11972622224",
    email: "Gui123.garcia@gmail.com",
    address: "Rua Capitão Luis Ramos, 342",
    password: "senha123"
)
