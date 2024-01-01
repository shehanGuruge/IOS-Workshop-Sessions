//
//  PostDetailViewModel.swift
//  Swiftui workshop
//
//  Created by Shehan Guruge on 2023-06-27.
//

import Foundation


class PostDetailViewModel: ObservableObject {
    private let apiService = ApiService.shared
    
    @Published var comments: [Comment] = []
    @Published var commentsRequestError: String?
    
    func getComments(postId: Int)  {
        Task {
            do {
                guard let result: [Comment]? =
                        try await apiService.get(path: "/comments?postId=\(postId)") else {
                    return
                }
                
                if(result == nil || result?.count == 0) {
                    setCommentsRequestError(error: "No comments for this post")
                } else {
                    invokeUIThread {
                        self.comments = result!
                    }
                }
            } catch ApiError.badResponse(let failure) {
                setCommentsRequestError(error: failure.message)
            } catch {
                setCommentsRequestError(error: error.localizedDescription)
            }
        }
    }
    
    
    func setCommentsRequestError(error: String?){
        invokeUIThread {
            self.commentsRequestError = error
        }
    }

    
    func invokeUIThread(action: @escaping () -> ()) {
        DispatchQueue.main.async {
            action()
        }
    }
}
