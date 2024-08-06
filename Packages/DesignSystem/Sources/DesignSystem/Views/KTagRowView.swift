import Env
import Models
import SwiftUI

public struct KTagRowView: View {
  @Environment(RouterPath.self) private var routerPath

  let kTag: KTag

  public init(kTag: KTag) {
    self.kTag = kTag
  }

  public var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text("#\(kTag.name)")
          .font(.scaledHeadline)
//        Text("design.tag.n-posts-from-n-participants \(tag.totalUses) \(tag.totalAccounts)")
//          .font(.scaledFootnote)
//          .foregroundStyle(.secondary)
      }
      Spacer()
//      TagChartView(tag: tag)
    }
    .contentShape(Rectangle())
    .onTapGesture {
        routerPath.navigate(to: .kTag(kTag: kTag))
    }
  }
}
