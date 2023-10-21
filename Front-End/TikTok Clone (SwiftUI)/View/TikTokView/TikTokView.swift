//

//

import SwiftUI

struct TikTokView: View {
    @ObservedObject var viewModel = TikTokViewModel()
    @State  var selectedIndex = 0

    let tikTokArray = [
        TikTokControls(title: "ONE Title", timeAgo: "2h ago", description: "This is the second video description.", buttons: [
            VideoButton(systemImageName: "heart.fill", subtitle: "10.1k"),
            VideoButton(systemImageName: "arrowshape.turn.up.forward.fill", subtitle: "204"),
        ]),
        TikTokControls(title: "Another Title", timeAgo: "3h ago", description: "This is the second video description.", buttons: [
            VideoButton(systemImageName: "heart.fill", subtitle: "100k"),
            VideoButton(systemImageName: "arrowshape.turn.up.forward.fill", subtitle: "101"),
        ]),
        TikTokControls(title: "Another Title", timeAgo: "3h ago", description: "This is the second video description.", buttons: [
            VideoButton(systemImageName: "heart.fill", subtitle: "100k"),
            VideoButton(systemImageName: "arrowshape.turn.up.forward.fill", subtitle: "101"),
        ]),
        TikTokControls(title: "Another Title", timeAgo: "3h ago", description: "This is the second video description.", buttons: [
            VideoButton(systemImageName: "heart.fill", subtitle: "100k"),
            VideoButton(systemImageName: "arrowshape.turn.up.forward.fill", subtitle: "101"),
        ]),
        TikTokControls(title: "Another Title", timeAgo: "3h ago", description: "This is the second video description.", buttons: [
            VideoButton(systemImageName: "heart.fill", subtitle: "100k"),
            VideoButton(systemImageName: "arrowshape.turn.up.forward.fill", subtitle: "101"),
        ]), TikTokControls(title: "Another Title", timeAgo: "3h ago", description: "This is the second video description.", buttons: [
            VideoButton(systemImageName: "heart.fill", subtitle: "100k"),
            VideoButton(systemImageName: "arrowshape.turn.up.forward.fill", subtitle: "101"),
        ])
        // Add more TikTokControls instances with different parameters and unique VideoButton arrays here
    ]

    
    var body: some View {
        ZStack {
            VideoView()
        }
        .ignoresSafeArea(.keyboard)
        
    }
    

    @ViewBuilder
        func VideoView() -> some View {
            GeometryReader { proxy in
                let size = proxy.size

                TabView(selection: $selectedIndex) {
                    ForEach(0..<DummyPhoto.photos.count, id: \.self) { index in
                        let tiktok = DummyPhoto.photos[index]
                        let overlayTikTok = tikTokArray[index]
                        
                        tiktok.photo
                            .resizable()
                            .clipped()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width)
                            .frame(height: size.height)
                            .clipped()
                            .overlay {
                                overlayTikTok
                               
                                    .padding(.bottom, 30)
                                    .padding(.trailing, 5)
                                    .padding(.leading, 10)
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



