//

//

import Foundation

struct TikTokVideo: Identifiable {
    let id = UUID()
    let user: String
    let desc: String
    let soundTitle: String
}

struct TikTokData: Identifiable {
    let id = UUID()
    let title: String
    let timeAgo: String
    let description: String
}
