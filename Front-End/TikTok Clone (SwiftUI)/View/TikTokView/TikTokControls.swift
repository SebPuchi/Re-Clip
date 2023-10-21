import SwiftUI

struct VideoButton: Identifiable, Hashable {
    let id = UUID()
    let systemImageName: String
    let subtitle: String?

    init(systemImageName: String, subtitle: String?) {
        self.systemImageName = systemImageName
        self.subtitle = subtitle
        
        
    }
}




struct TikTokControls: View {
    let title: String
    let timeAgo: String
    let description: String
    let buttons: [VideoButton]

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
                Text(title)
                Text("· \(timeAgo)")
                    .opacity(0.5)
            }
            .fontWeight(.medium)

            ExpandableText(text: description)
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
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }
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
    func VideoButtons() -> some View {
        VStack(alignment: .trailing, spacing: 15) {
            ForEach(buttons, id: \.id) { button in
                Button {
                    // Handle button action here
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

