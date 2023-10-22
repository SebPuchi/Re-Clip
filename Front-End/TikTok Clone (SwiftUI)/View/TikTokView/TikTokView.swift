//

//

import SwiftUI

import AVKit

struct TikTokView: View {
    @ObservedObject var viewModel = TikTokViewModel()
    @State  var selectedIndex = 0
    var tikTokArray: [TikTokControls]

        init(tikTokArray: [TikTokControls]) {
            self.tikTokArray = tikTokArray
        }


    
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
                    ForEach(0..<AIVideoModels.videos.count, id: \.self) { index in
                        let video = AIVideoModels.videos[index]

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
                            }.rotationEffect(.init(degrees: -90))
                            .ignoresSafeArea(.all, edges: .top)
                    }
                }    .rotationEffect(.init(degrees: 90))
                    .frame(width: size.height)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(width: size.width)
                    .onChange(of: selectedIndex) { newValue in
                                // Pause the video when the tab view index changes
                                player(for: AIVideoModels.videos[newValue]).pause()
                            }
            }
        }

        func player(for video: AIVideoModels) -> AVPlayer {
            return AVPlayer(url: video.videoURL)
        }
    
    

    
    
    
}



