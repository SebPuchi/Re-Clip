//
//  HomeView.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/18/22.
//

import SwiftUI

struct HomeView: View {
    @Namespace var nsHome
    
    
    var body: some View {
        
        ZStack {
           
            TikTokView().ignoresSafeArea()
          
        }.frame(maxWidth: .infinity)
            .background(Color.black)

        
    }
    
    
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
