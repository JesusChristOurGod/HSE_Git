//
//  BrowseView.swift
//  HSE_Git
//
//  Created by Горячев Александр on 02.07.2021.
//

import SwiftUI

struct BrowseView: View {
    @State var repos: [RepositoryModel] = [
        RepositoryModel(name: "Repo1", description: "Cool repo", language: "Java", userName: "Pablo"),
        RepositoryModel(name: "Repo2", description: "Nice repo", language: "C#", userName: "Juan"),
        RepositoryModel(name: "Repo3", description: "Great repo", language: "Pascal", userName: "Marco"),
        RepositoryModel(name: "Repo4", description: "Neat repo", language: "JS", userName: "Martin"),
        RepositoryModel(name: "Repo5", description: "Good repo", language: "Swift", userName: "Thomas")
    ]
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                ForEach (repos) { repo in
                    HStack(alignment: .center, spacing: 90){
                        VStack(alignment: .leading){
                            Text(repo.name)
                            HStack {
                                Text("made by:")
                                Text(repo.userName)
                            
                            }
                        }
                        VStack(alignment: .leading) {
                            Text(repo.description)
                            Text(repo.language)
                        }
                    }
                    
                }
            }
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
