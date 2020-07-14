//
//  HomeView.swift
//  InstagramClone
//
//  Created by Shashikant's_Macmini on 14/07/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State var url = ""
    @State var user = ""
    @State var show = false
    @ObservedObject var observed = Observer()
    @ObservedObject var postObserved = PostObserver()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(observed.status) { i in
                            StatusCard(imName: i.image, user: i.name, show: self.$show, user1: self.$user, url: self.$url)
                                .padding(.leading, 10)
                        }
                    }.animation(.spring())
                }
            }
            if postObserved.posts.isEmpty {
                Text("No Posts")
                    .fontWeight(.light)
            } else {
                ForEach(postObserved.posts) { post in
                    PostCard(id: post.id, user: post.name, image: post.image, likes: post.likes, comments: post.comments)
                }
            }
        }
        .sheet(isPresented: $show) {
            StatusView(url: self.url, name: self.user)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
