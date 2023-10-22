//
//  AIVideoModels.swift
//  Re-Clip
//
//  Created by Sebastian Pucher on 10/21/23.
//

import SwiftUI
import AVKit

struct AIVideoModels: Identifiable {
    let id = UUID()
    let videoURL: URL
}

extension AIVideoModels {
    static let videos: [AIVideoModels] = [
        AIVideoModels(videoURL: Bundle.main.url(forResource: "localsend", withExtension: "mp4")!),
        AIVideoModels(videoURL: Bundle.main.url(forResource: "LLM.", withExtension: "mp4")!),
        AIVideoModels(videoURL: Bundle.main.url(forResource: "open.pilot", withExtension: "mp4")!),
        AIVideoModels(videoURL: Bundle.main.url(forResource: "open.pilot", withExtension: "mp4")!),
        AIVideoModels(videoURL: Bundle.main.url(forResource: "traffic", withExtension: "mp4")!),
        AIVideoModels(videoURL: Bundle.main.url(forResource: "robot", withExtension: "mp4")!)
    ]
}
