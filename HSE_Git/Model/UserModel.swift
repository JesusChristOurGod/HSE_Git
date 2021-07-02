//
//  UserModel.swift
//  HSE_Git
//
//  Created by Горячев Александр on 02.07.2021.
//

import Foundation
struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let repos: [RepositoryModel]
    let isFavourite: Bool
    
}
