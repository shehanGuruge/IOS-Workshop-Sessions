//
//  HomeViewModel.swift
//  Swiftui workshop
//
//  Created by Shehan Guruge on 2023-06-26.
//

import Foundation


class PostViewModel: ObservableObject {
    private let apiService = ApiService.shared
    
    @Published var postTitle: String = ""
    @Published var postContent: String = ""
    
    @Published var posts: [Post] = []
    @Published var postsRequestError: String?

    
    func getPosts() {
        Task {
            do {
                guard let result: [Post]? = try await apiService.get(path: "posts") else {
                    return
                }
                
                if(result == nil || result?.count == 0) {
                    invokeUIThread {
                        self.postsRequestError =  "No posts found"
                    }
                } else {
                    invokeUIThread {
                        self.posts.append(contentsOf: result!)
                    }
                }
            } catch {
                invokeUIThread {
                    self.postsRequestError = error.localizedDescription
                }
            }
        }
    }
    
   
    func deletePost(postId: Int) {
        if(!posts.isEmpty) {
            if let index = posts.firstIndex(where: {$0.id == postId}) {
                posts.remove(at: index)
            }
        }
    }
    
    func invokeUIThread(action: @escaping () -> ()) {
        DispatchQueue.main.async {
            action()
        }
    }
    
    
    func addPost(){
        if(!postTitle.isEmpty && !postContent.isEmpty){
            let post = Post(userId: 1, id: getCurrentMillis(), title: postTitle, body: postContent)
            posts.append(post)
            postTitle = ""
            postContent = ""
        }
    }
    
    
    func getCurrentMillis()->Int{
        return  Int(NSDate().timeIntervalSince1970 * 1000)
    }
}
