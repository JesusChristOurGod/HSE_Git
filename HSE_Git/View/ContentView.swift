//
//  ContentView.swift
//  HSE_Git
//
//  Created by Горячев Александр on 02.07.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userViewModel = UserViewModel()
    @StateObject var repositoryViewModel = RepositoryViewModel()
    
    
    var body: some View {
        TabView{
            BrowseView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text ("Search for users")
                }
            FavouritesView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text ("Favourite users")
                }

            HistoryView()
                .tabItem {
                    Image(systemName: "deskclock")
                    Text ("History of searches")
                }

//        }.onAppear(perform: {
//            repositoryViewModel.addNewRepo(name: "Repository1", description: "Cool repo", language: "Java", userName: "Pablo")
//            repositoryViewModel.addNewRepo(name: "Repository2", description: "Cool repo", language: "Java", userName: "Pablo")
//            repositoryViewModel.addNewRepo(name: "Repository3", description: "Cool repo", language: "Java", userName: "Pablo")
//        })
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
