//
//  BrowseView.swift
//  HSE_Git
//
//  Created by Горячев Александр on 02.07.2021.
//

import SwiftUI

struct BrowseView: View {
    
    // следующие массивы задаются программно для демонстрации
    // по-хорошему надо было бы добавлять через функции addNew из ViewModels
    @State var repos: [RepositoryModel] = [
        RepositoryModel(name: "Robot", description: "Cool repo", language: "Java", userName: "Pablo"),
        RepositoryModel(name: "Media", description: "Nice repo", language: "C#", userName: "Juan"),
        RepositoryModel(name: "Medusa", description: "Great repo", language: "Pascal", userName: "Marco"),
        RepositoryModel(name: "Bot", description: "Neat repo", language: "JS", userName: "Martin"),
        RepositoryModel(name: "Channel", description: "Good repo", language: "Swift", userName: "Thomas"),
        RepositoryModel(name: "Chan", description: "Awesome repo", language: "F#", userName: "Lukas"),
        RepositoryModel(name: "Anime", description: "Pretty repo", language: "Ruby", userName: "Jesus")
    ]
    
    @State var users: [UserModel] = [
        UserModel(name: "Marco",
                  repos: [RepositoryModel(name: "MarcoFirst", description: "cool stuff", language: "Java", userName: "Marco"),
                          RepositoryModel(name: "MarcoSecond", description: "hello world", language: "Java", userName: "Marco"),
                          RepositoryModel(name: "MarcoThird", description: "goodbye world", language: "Java", userName: "Marco"), ],
                  isFavourite: true),
        UserModel(name: "Alex",
                  repos: [RepositoryModel(name: "AlexFirst", description: "cool stuff", language: "Java", userName: "Alex"),
                          RepositoryModel(name: "AlexSecond", description: "hello world", language: "Java", userName: "Alex"),
                          RepositoryModel(name: "AlexThird", description: "goodbye world", language: "Java", userName: "Alex"), ],
                  isFavourite: false),
        UserModel(name: "John",
                  repos: [RepositoryModel(name: "JohnFirst", description: "cool stuff", language: "Java", userName: "John"),
                          RepositoryModel(name: "JohnSecond", description: "hello world", language: "Java", userName: "John"),
                          RepositoryModel(name: "JohnThird", description: "goodbye world", language: "Java", userName: "John"), ],
                  isFavourite: true),
        UserModel(name: "Kenny",
                  repos: [RepositoryModel(name: "KennyFirst", description: "cool stuff", language: "Java", userName: "Kenny"),
                          RepositoryModel(name: "KennySecond", description: "hello world", language: "Java", userName: "Kenny"),
                          RepositoryModel(name: "KennyThird", description: "goodbye world", language: "Java", userName: "Kenny"), ],
                  isFavourite: false),
        
        
    ]
    @State var textFieldText: String = ""
    
//MARK: Actual View
    var body: some View {
        NavigationView {
            VStack{
                TextField("Search by name or id...", text: $textFieldText)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.black.opacity(0.7))
                    .font(.headline)
                    .disableAutocorrection(true)
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                    .overlay(
                        HStack{
                            Spacer()
                            Image(systemName: "magnifyingglass")
                        }.padding(.horizontal, 30)
                                
                    )
                ScrollView{
                    
                    UserColumn.padding(.top, 30)
                        .navigationBarTitle("Search")
                    
                }
            }
        }
    }
}
//MARK: Column with users' repositories
extension BrowseView {
    private var RepositoryColumn: some View {
        VStack(alignment: .leading, spacing: 70) {
            ForEach (repos) { repo in
                if repo.name.contains(textFieldText) || textFieldText.isEmpty {
                HStack(alignment: .center){
                    VStack(alignment: .leading){
                        Text(repo.name).font(.title)
                        HStack {
                            Text("made by:")
                            Text(repo.userName).fontWeight(.semibold)
                        
                        }
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(repo.description)
                        Text(repo.language).font(.title2)
                    }
                }.padding(.horizontal, 40)
                .background(
                    Color(UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)).frame(height: 80).cornerRadius(20).shadow(color: .black.opacity(0.4), radius: 2, x: 3, y: 3)
                    )
                    
                }
            }
        }.padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}
//MARK: Column with users
extension BrowseView {
    private var UserColumn: some View {
        VStack(alignment: .leading, spacing: 70) {
            ForEach (users) { user in
                if user.name.contains(textFieldText) || textFieldText.isEmpty {
                    NavigationLink(
                        destination:
                            RepositoryColumn
                    )//здесь добавится View с репозиториями конкретного юзера
                     // Пока не успел правильно вложить RepositoryModel в UserModel
                    {
                    HStack(){
                        VStack(alignment: .leading){
                            Text(user.name).font(.title)
                            Text("Number of repos: 3")
                        }
                        Spacer()
                        
                        Button(action: {}, label: {
                                Image(systemName: "star.fill")
                                    .foregroundColor(user.isFavourite ? Color.blue : Color.black).font(.largeTitle)
                            })
                            
                    }.padding(.horizontal, 40)
                    
                     .background(
                        Color(UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)).frame(height: 80).cornerRadius(20).shadow(color: .black.opacity(0.4), radius: 2, x: 3, y: 3)
                        )
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }.padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}
//MARK: Preview
struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
