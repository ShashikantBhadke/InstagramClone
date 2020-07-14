//
//  PostObserver.swift
//  InstagramClone
//
//  Created by Shashikant's_Macmini on 14/07/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import Firebase
import Foundation

class PostObserver: ObservableObject {
    
    @Published var posts = [PostModel]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("posts").addSnapshotListener { (snap, err) in
            if err != nil {
                debugPrint(err?.localizedDescription ?? "err")
                return
            } else {
                guard let s = snap else {
                    debugPrint("err")
                    return
                }
                for i in s.documentChanges {
                    if i.type == .added {
                        let id = i.document.documentID
                        let name = i.document.get("name") as? String ?? ""
                        let image = i.document.get("image") as? String ?? ""
                        let comments = i.document.get("comments") as? String ?? ""
                        let likes = i.document.get("likes") as? String ?? ""
                        let obj = PostModel(id: id, name: name, image: image, comments: comments, likes: likes)
                        self.posts.insert(obj, at: 0)
                    }
                    
                    if i.type == .removed {
                        let id = i.document.documentID
                        self.posts.removeAll { (obj) -> Bool in
                            obj.id == id
                        }
                    }
                    if i.type == .modified {
                        let id = i.document.documentID
                        let comments = i.document.get("comments") as? String ?? ""
                        let likes = i.document.get("likes") as? String ?? ""
                        for j in 0..<self.posts.count {
                            if self.posts[j].id == id {
                                self.posts[j].likes = likes
                                self.posts[j].comments = comments
                                return
                            }
                        }
                    }
                }
            }
        }
    }
}
