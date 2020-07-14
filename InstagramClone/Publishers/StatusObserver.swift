//
//  StatusObserver.swift
//  InstagramClone
//
//  Created by Shashikant's_Macmini on 14/07/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import Firebase
import Foundation

class Observer: ObservableObject {
    
    @Published var status = [StatusModel]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("status").addSnapshotListener { (snap, err) in
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
                        let obj = StatusModel(id: id, name: name, image: image)
                        self.status.insert(obj, at: 0)
                    }
                    
                    if i.type == .removed {
                        let id = i.document.documentID
                        self.status.removeAll { (obj) -> Bool in
                            obj.id == id
                        }
                    }
                }
            }
            
        }
    }
}
