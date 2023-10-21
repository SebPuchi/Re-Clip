//
//  HomeView.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/18/22.
//

import SwiftUI

struct HomeView: View {
    @State var tabSelection = 2
    
    @Namespace var nsHome
    
    let commentsHeight = UIScreen.main.bounds.height * 0.75
    
    var body: some View {
        ZStack {
            TabView(selection: $tabSelection) {
                TikTokView()
                    .tag(1)
                TikTokView()
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.keyboard)
            .edgesIgnoringSafeArea(.top)
            
            
        }
        .foregroundColor(.white)
        
    }
    
    
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
