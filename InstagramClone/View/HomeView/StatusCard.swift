//
//  StatusCard.swift
//  InstagramClone
//
//  Created by Shashikant's_Macmini on 14/07/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct StatusCard: View {
    
    var imName = ""
    var user = ""
    @Binding var show: Bool
    @Binding var user1: String
    @Binding var url: String
    
    var body: some View {
        
        VStack {
            AnimatedImage(url: URL(string: imName)!)
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .onTapGesture {
                    self.user1 = self.user
                    self.url = self.imName
                    self.show.toggle()
            }
            Text(user)
                .fontWeight(.heavy)
        }
    }
}

//struct StatusCard_Previews: PreviewProvider {
//    static var previews: some View {
//        StatusCard(show: <#Binding<Bool>#>, user1: <#Binding<String>#>, url: <#Binding<String>#>)
//    }
//}
