//

//

import SwiftUI

struct HomeView: View {
    @Namespace var nsHome
    
    
    var body: some View {
        
        ZStack {
           
            TikTokView().ignoresSafeArea()
          
        }.frame(maxWidth: .infinity)
            .background(Color.black)

        
    }
    
    
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
