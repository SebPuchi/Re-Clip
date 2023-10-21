//

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
                        .frame(height: size.height)
                        .clipped()
                    
                    //Vertical Controls
                        .overlay {
                            TikTokControls(title: "A NEW RESARHC PAPER", timeAgo: "1h ago", description: "This is the first video description.")
                                .padding(.bottom,30)
                                .padding(.trailing,5)
                                .padding(.leading,10)
                        }
                        .rotationEffect(.init(degrees: -90))
                        .ignoresSafeArea(.all, edges: .top)
                        
                    
                }
            }
            //Scrollable view (Transformation of horizontal to vert (kinda of loose but works)
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
