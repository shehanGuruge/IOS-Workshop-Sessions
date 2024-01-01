//
//  CommentsView.swift
//  Swiftui workshop
//
//  Created by Shehan Guruge on 2023-06-26.
//

import SwiftUI

struct CommentsView: View {
    let post: Post
    @EnvironmentObject var postViewModel: PostViewModel
    @StateObject var postDetailViewModel = PostDetailViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            VStack {
                Text(post.title)
                    .bold()
                    .font(.system(size: 13.0))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(post.body)
                    .font(.system(size: 13.0))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.top], 5.0)
            }
            .padding(15.0)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(10)
           
            HStack {
                Spacer()
                AppButton(backgroundColor: Color.red, buttonTitle: "Delete Post") {
                    postViewModel.deletePost(postId: post.id)
                    dismiss()
                }
            }
          
            Spacer()
            
            if(postDetailViewModel.comments.isEmpty){
                if let error = postDetailViewModel.commentsRequestError {
                    Text(error)
                }
                Spacer()
            } else {
                List(postDetailViewModel.comments) { e in
                    VStack {
                        Text(e.body)
                            .font(.system(size: 13.0))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(e.email)
                            .font(.system(size: 11.0))
                            .padding([.top], 6.0)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }
        }
        .padding([.leading, .trailing], 10.0)
        .navigationTitle("Post Detail")
        .onAppear {
            postDetailViewModel.getComments(postId: post.id)
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(post:Post(userId: 1, id: 1, title: "String", body: "String"), postDetailViewModel: PostDetailViewModel())
            .environmentObject(PostViewModel())
    }
}
