//
//  RepositoryModel.swift
//  HSE_Git
//
//  Created by Горячев Александр on 02.07.2021.
//

import Foundation
struct RepositoryModel: Identifiable {
    let id:String = UUID().uuidString
    let name: String
    let description: String
    let language: String
    let userName: String
}
