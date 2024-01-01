//
//  HomeView.swift
//  Swiftui workshop
//
//  Created by Shehan Guruge on 2023-06-26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var postViewModel = PostViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Add Posts")
                    .bold()
                    .font(.largeTitle)
                
                InputView(text: $postViewModel.postTitle, placeholder: "Enter Post Titile")
                    .padding([.bottom], 10.0)
                InputView(text: $postViewModel.postContent, placeholder: "Enter Post Content")
                    .padding([.bottom], 20.0)
                    
                
                AppButton(buttonTitle: "Add Post") {
                    postViewModel.addPost()
                }
            
                
                Text("Total number of posts: \(postViewModel.posts.count)")
                    .padding([.top], 30.0)
                
                Spacer()
                NavigationLink("View All Posts"){
                    PostListView()
                        .navigationTitle("Posts")
                }
            }
            .padding(20.0)
        }
        .environmentObject(postViewModel)
        .environmentObject(PostViewModel())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
