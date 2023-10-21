//
//  ContentView.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/16/22.
//

import SwiftUI

struct TikTokView: View {
    @ObservedObject var viewModel = TikTokViewModel()

    @State var selectedIndex = 0
    
    var body: some View {
        ZStack {
            VideoView()
        }
        .ignoresSafeArea(.keyboard)
        
    }
    

    @ViewBuilder
    func VideoView()->some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            TabView {
                ForEach(DummyPhoto.photos, id: \.id) { tiktok in
                    tiktok.photo
                        .resizable().clipped()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width)
                        .clipped()
                        .overlay {
                            TikTokControls()
                                .padding(.bottom)
                        }
                        .rotationEffect(.init(degrees: -90))
                        .ignoresSafeArea(.all, edges: .top)
                        
                    
                }
            }
            .rotationEffect(.init(degrees: 90))
            .frame(width: size.height)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: size.width)
         
        }
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TikTokView()
    }
}
