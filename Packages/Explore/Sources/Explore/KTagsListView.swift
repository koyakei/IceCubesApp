import DesignSystem
import Models
import SwiftUI

public struct KTagsListView: View {
  @Environment(Theme.self) private var theme

  let kTags: [KTag]

  public init(kTags: [KTag]) {
    self.kTags = kTags
  }

  public var body: some View {
    List {
      ForEach(kTags) { kTag in
        KTagRowView(kTag: kTag)
        #if !os(visionOS)
          .listRowBackground(theme.primaryBackgroundColor)
        #endif
          .padding(.vertical, 4)
      }
    }
    #if !os(visionOS)
    .scrollContentBackground(.hidden)
    .background(theme.primaryBackgroundColor)
    .listStyle(.plain)
    #else
    .listStyle(.grouped)
    #endif
    .navigationTitle("explore.section.trending.tags")
    .navigationBarTitleDisplayMode(.inline)
  }
}
