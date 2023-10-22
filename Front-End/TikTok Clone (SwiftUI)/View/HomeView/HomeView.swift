//

//

import SwiftUI

struct HomeView: View {
    @Namespace var nsHome
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
           
            TikTokView(tikTokArray: tikTokArray).ignoresSafeArea()
          
        }.frame(maxWidth: .infinity)
            .background(Color.black)

        
    }
    
    
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
