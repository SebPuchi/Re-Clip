//
//  HomeView.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/18/22.
//

import SwiftUI

struct HomeView: View {

    
    @Namespace var nsHome
    
    let commentsHeight = UIScreen.main.bounds.height * 0.75
    
    var body: some View {
        ZStack {
            TabView() {
                TikTokView()
                    
      
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
