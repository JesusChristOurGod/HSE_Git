//
//  UserViewModel.swift
//  HSE_Git
//
//  Created by Горячев Александр on 02.07.2021.
//

import Foundation
public class UserViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    
    func addNewUser (name: String, repos: [RepositoryModel], isFavourite: Bool) {
        let newUser = UserModel (name: name, repos: repos, isFavourite: isFavourite)
        users.append(newUser)
    }
}
