//
//  TikTokControls.swift
//  TikTok Clone (SwiftUI)
//
//  Created by Jesse Chan on 11/16/22.
//

import SwiftUI

struct VideoButton: Identifiable, Hashable {
    let id = UUID()
    let systemImageName: String
    let subtitle: String?
}

extension VideoButton {
    static let buttons = [
        VideoButton(systemImageName: "heart.fill", subtitle: "322"),
        VideoButton(systemImageName: "arrowshape.turn.up.forward.fill", subtitle: "105"),
 
    ]
}

struct TikTokControls: View {
  
    var body: some View {
        ZStack {
                VStack {
                        Spacer()
                            HStack(alignment: .bottom) {
                                VideoDetails()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.trailing, 30)
                                VideoButtons()
                            }
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    func VideoDetails() -> some View {
        VStack(alignment: .leading, spacing: 7.5) {
            HStack {
                Text("TITLE_OF_PAPER")
                Text("· 3d ago")
                    .opacity(0.5)
            }
            .fontWeight(.medium)

            ExpandableText(text: """
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                """
            )
        }
        .font(.callout)
    }

    struct ExpandableText: View {
        @State private var isExpanded = false
        let text: String

        var body: some View {
            if isExpanded {
                Text(text)
                    .font(.callout)
                    .opacity(0.75)
            } else {
                Text(text)
                    .lineLimit(2)
                    .font(.callout)
                    .opacity(0.75)
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }
            }
        }
    }

    
    @ViewBuilder
    func VideoButtons()->some View {
        VStack(alignment: .trailing, spacing: 15) {
            
            
            ForEach(VideoButton.buttons, id: \.id) { button in
                Button {
                
                } label: {
                    VStack(spacing: 2.5) {
                        Image(systemName: button.systemImageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                        if let subtitle = button.subtitle {
                            Text(subtitle)
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                    }
                }
            }
        }
    }
}

