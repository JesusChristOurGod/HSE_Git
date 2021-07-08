//
//  ContentView.swift
//  HSE_Git
//
//  Created by Горячев Александр on 02.07.2021.
//

import SwiftUI
// ContentView - просто родительский View для вкладок
struct ContentView: View {
    @StateObject var userViewModel = UserViewModel()
    @StateObject var repositoryViewModel = RepositoryViewModel()
    
    
    var body: some View {
        TabView{
            BrowseView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text ("Search for repositories")
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
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
