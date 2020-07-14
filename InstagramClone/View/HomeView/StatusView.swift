//
//  StatusView.swift
//  InstagramClone
//
//  Created by Shashikant's_Macmini on 14/07/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct StatusView: View {
    
    var url = ""
    var name = ""
    
    var body: some View {
        ZStack {
            AnimatedImage(url: URL(string: url)!)
            VStack {
                HStack {
                    Text(name)
                    .font(.headline)
                    .fontWeight(.heavy)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
    }
}
