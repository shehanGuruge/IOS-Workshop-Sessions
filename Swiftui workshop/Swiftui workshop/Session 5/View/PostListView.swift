//
//  PostsView.swift
//  Swiftui workshop
//
//  Created by Shehan Guruge on 2023-06-26.
//

import SwiftUI

struct PostListView: View {
    @EnvironmentObject var postViewModel: PostViewModel
    
    var body: some View {
        VStack{
            Spacer()
            if(postViewModel.posts.isEmpty){
                if let error = postViewModel.postsRequestError {
                    Text(error)
                }
                Spacer()
            } else {
                List(postViewModel.posts) { post in
                    NavigationLink(destination:
                                    CommentsView(post: post)
                    ) {
                        VStack {
                            Text(post.title)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(post.body)
                                .font(.system(size: 12.0))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.top], 5.0)
                        }
                    }
                }
            }
            
            AppButton (buttonTitle: "Get All Posts") {
                postViewModel.getPosts()
            }
        }
         
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
            .environmentObject(PostViewModel())
    }
}
