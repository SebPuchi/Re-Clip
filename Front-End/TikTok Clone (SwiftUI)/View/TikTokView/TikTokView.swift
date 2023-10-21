//

//

import SwiftUI

import AVKit

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
                    ForEach(0..<DummyVideo.videos.count, id: \.self) { index in
                        let video = DummyVideo.videos[index]

                        VideoPlayer(player: player(for: video))
                            .frame(width: size.width)
                            .frame(height: size.height)
                            .onAppear {
                                // Start playing the video when it appears
                                player(for: video).play()
                            }
                            .onDisappear {
                                // Stop the video when it disappears
                                player(for: video).pause()
                            }
                            .overlay {
                                let overlayTikTok = tikTokArray[index]
                                overlayTikTok
                                    .padding(.bottom, 30)
                                    .padding(.trailing, 5)
                                    .padding(.leading, 10)
                            }
                    }
                }
            }
        }

        func player(for video: DummyVideo) -> AVPlayer {
            return AVPlayer(url: video.videoURL)
        }
    
}



