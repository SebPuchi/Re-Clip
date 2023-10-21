//
//  AIVideoModels.swift
//  Re-Clip
//
//  Created by Sebastian Pucher on 10/21/23.
//

import SwiftUI
import AVKit

struct DummyVideo: Identifiable {
    let id = UUID()
    let videoURL: URL
}

extension DummyVideo {
    static let videos: [DummyVideo] = [
        DummyVideo(videoURL: Bundle.main.url(forResource: "Snaptik", withExtension: "mp4")!),
        DummyVideo(videoURL: Bundle.main.url(forResource: "Snaptik", withExtension: "mp4")!),
        DummyVideo(videoURL: Bundle.main.url(forResource: "Snaptik", withExtension: "mp4")!)
    ]
}
