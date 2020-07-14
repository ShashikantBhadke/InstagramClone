//
//  PostCard.swift
//  InstagramClone
//
//  Created by Shashikant's_Macmini on 14/07/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct PostCard: View {
    var id          = ""
    var user        = ""
    var image       = ""
    var likes       = ""
    var comments    = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AnimatedImage(url: URL(string: image)!)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                Text(user)
                Spacer()
                Button(action: {
                    
                }){
                    Image("menu")
                        .resizable()
                        .frame(width: 15, height: 15)
                }.foregroundColor(Color("darkAndWhite"))
            }
            AnimatedImage(url: URL(string: image)!)
                .resizable()
                .frame(height: 350)
                .cornerRadius(5)
            HStack {
                Button(action: {
                    
                }){
                    Image("comment")
                        .resizable()
                        .frame(width: 25, height: 25)
                }.foregroundColor(Color("darkAndWhite"))
                Button(action: {
                    if let prelike = Int.init(self.likes) {
                        let db = Firestore.firestore()
                        db.collection("posts").document(self.id).updateData(["likes": "\(prelike + 1)"]) { (err) in
                            if err != nil {
                                return
                            }
                        }
                    }
                }){
                    Image("heart")
                        .resizable()
                        .frame(width: 25, height: 25)
                }.foregroundColor(Color("darkAndWhite"))
                
                Spacer()
                
                Button(action: {
                    
                }){
                    Image("saved")
                        .resizable()
                        .frame(width: 25, height: 25)
                }.foregroundColor(Color("darkAndWhite"))
            }.padding(.top, 8)
            
            Text("\(likes) Likes")
                .padding(.top, 8)
            Text("View all \(comments) Comments")
            
        }.padding(8)
    }
}

struct PostCard_Previews: PreviewProvider {
    static var previews: some View {
        PostCard()
    }
}
