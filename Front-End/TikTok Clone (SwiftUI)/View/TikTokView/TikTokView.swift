//

//

import SwiftUI

import AVKit

struct TikTokView: View {
    @ObservedObject var viewModel = TikTokViewModel()
    @State  var selectedIndex = 0

    let tikTokArray = [
        TikTokControls(title: "LocalSend", timeAgo: "7h ago", description: "LocalSend is a cross-platform app that enables secure communication between devices using a REST API and HTTPS encryption. Unlike other messaging apps that rely on external servers, LocalSend doesn't require an internet connection or third-party servers, making it a fast and reliable solution for local communication.", buttons: [
            VideoButton(systemImageName: "heart.fill", subtitle: "18.8k"),
            VideoButton(systemImageName: "arrowshape.turn.up.forward.fill", subtitle: "912"),
        ]),
        TikTokControls(title: "TensorRT | Large Language Model ", timeAgo: "4h ago", description: "TensorRT-LLM provides users with an easy-to-use Python API to define Large Language Models (LLMs) and build TensorRT engines that contain state-of-the-art optimizations to perform inference efficiently on NVIDIA GPUs.", buttons: [
            VideoButton(systemImageName: "heart.fill", subtitle: "1.1k"),
            VideoButton(systemImageName: "arrowshape.turn.up.forward.fill", subtitle: "101"),
        ]),
        TikTokControls(title: "Open-Pilot", timeAgo: "18h ago", description: "Openpilot is an open source driver assistance system. Currently, openpilot performs the functions of Adaptive Cruise Control (ACC), Automated Lane Centering (ALC), Forward Collision Warning (FCW), and Lane Departure Warning (LDW) for a growing variety of supported car makes, models, and model years. ", buttons: [
            VideoButton(systemImageName: "heart.fill", subtitle: "42k"),
            VideoButton(systemImageName: "arrowshape.turn.up.forward.fill", subtitle: "7.8k"),
        ]),
        TikTokControls(title: "Black-Litterman Asset Allocation under Hidden Truncation Distribution", timeAgo: "10/18/2023", description: "Jungjun Park | The paper examines the Black-Litterman model using the skew-normal distribution, showing that posterior returns are also skewed. Empirical data reveal a trade-off between risk and skewness in portfolios as expected returns increase.", buttons: [
            VideoButton(systemImageName: "heart.fill", subtitle: "10.2k"),
            VideoButton(systemImageName: "arrowshape.turn.up.forward.fill", subtitle: "3k"),
        ]),
        TikTokControls(title: "Vision-Based Traffic Accident Detection and Anticipation: A Survey", timeAgo: "8/30/2023", description: "Jianwu Fang | This paper is the first survey on Vision-TAD and Vision-TAA, focusing on traffic accident detection and anticipation in the era of deep learning.", buttons: [
            VideoButton(systemImageName: "heart.fill", subtitle: "42k"),
            VideoButton(systemImageName: "arrowshape.turn.up.forward.fill", subtitle: "7.8k"),
        ]), TikTokControls(title: "Robots that Take Advantage of Human Trust", timeAgo: "10/12/2023", description: "Dylan P. Losey | The paper investigates how humans trust robots to act rationally, and when robots capitalize on this trust to optimize their own objectives, it leads to more communicative robot behavior and increased user engagement.", buttons: [
            VideoButton(systemImageName: "heart.fill", subtitle: "100k"),
            VideoButton(systemImageName: "arrowshape.turn.up.forward.fill", subtitle: "101"),
        ])
       
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



