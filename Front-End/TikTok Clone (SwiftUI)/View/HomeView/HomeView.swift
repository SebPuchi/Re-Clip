//

//

import SwiftUI

struct HomeView: View {
    @Namespace var nsHome

    import Foundation

    // Create a class to handle XML parsing
    class EntryXMLParserDelegate: NSObject, XMLParserDelegate {
        var parsingEntry = false
        var entryData = [String: String]()
        
        // Called when an opening tag is encountered
        func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
            if elementName == "entry" {
                parsingEntry = true
            }
        }
        
        // Called when the parser encounters characters within a tag
        func parser(_ parser: XMLParser, foundCharacters string: String) {
            if parsingEntry {
                entryData[currentElement ?? ""] = (entryData[currentElement ?? ""] ?? "") + string
            }
        }
        
        // Called when a closing tag is encountered
        func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
            if elementName == "entry" {
                parsingEntry = false
            }
        }
        
        // Called when the parsing is complete
        func parserDidEndDocument(_ parser: XMLParser) {
            print(entryData)
        }
    }


    //
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
