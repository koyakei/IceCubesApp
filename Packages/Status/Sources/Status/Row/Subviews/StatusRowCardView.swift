import DesignSystem
import Models
import NukeUI
import Shimmer
import SwiftUI

public struct StatusRowCardView: View {
  @EnvironmentObject private var theme: Theme
  @Environment(\.openURL) private var openURL
  let card: Card

  public init(card: Card) {
    self.card = card
  }

  public var body: some View {
    if let title = card.title, let url = URL(string: card.url) {
      VStack(alignment: .leading) {
        if let imageURL = card.image {
          LazyImage(url: imageURL) { state in
            if let image = state.imageContainer?.image {
              SwiftUI.Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
            } else if state.isLoading {
              Rectangle()
                .fill(Color.gray)
                .frame(height: 200)
            }
          }
          .frame(height: 200)
        }
        HStack {
          VStack(alignment: .leading, spacing: 6) {
            Text(title)
              .font(.scaledHeadline)
              .lineLimit(3)
            if let description = card.description, !description.isEmpty {
              Text(description)
                .font(.scaledBody)
                .foregroundColor(.gray)
                .lineLimit(3)
            }
            Text(url.host() ?? url.absoluteString)
              .font(.scaledFootnote)
              .foregroundColor(theme.tintColor)
              .lineLimit(1)
          }
          Spacer()
        }.padding(8)
      }
      .fixedSize(horizontal: false, vertical: true)
      .background(theme.secondaryBackgroundColor)
      .cornerRadius(16)
      .overlay(
        RoundedRectangle(cornerRadius: 16)
          .stroke(.gray.opacity(0.35), lineWidth: 1)
      )
      .frame(maxWidth: .maxColumnWidth)
      .onTapGesture {
        openURL(url)
      }
      .contextMenu {
        ShareLink(item: url) {
          Label("status.card.share", systemImage: "square.and.arrow.up")
        }
        Button { openURL(url) } label: {
          Label("status.action.view-in-browser", systemImage: "safari")
        }
        Divider()
        Button {
          UIPasteboard.general.url = url
        } label: {
          Label("status.card.copy", systemImage: "doc.on.doc")
        }
      }
    }
  }
}
