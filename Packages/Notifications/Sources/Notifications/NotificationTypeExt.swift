import DesignSystem
import Models
import SwiftUI

extension Models.Notification.NotificationType {
  public func label(count: Int) -> LocalizedStringKey {
    switch self {
    case .status:
      "notifications.label.status"
    case .mention:
      ""
    case .reblog:
      "notifications.label.reblog \(count)"
    case .follow:
      "notifications.label.follow \(count)"
    case .follow_request:
      "notifications.label.follow-request"
    case .favourite:
      "notifications.label.favorite \(count)"
    case .poll:
      "notifications.label.poll"
    case .update:
      "notifications.label.update"
        case .k_tag_add_relation_request:
            "notifications.label.k-tag.relation.request.add"
        case .k_tag_delete_relation_request:
            "notifications.label.k-tag.relation.request.delete"
        case .follow_k_tag:
            "notifications.label.k-tag.follow"
        case .k_tag_add_relation_request_denied:
            "notifications.label.k-tag.relation.request.add.denied"
        case .k_tag_delete_relation_request_denied:
            "notifications.label.k-tag.relation.request.delete.denied"
        case .k_tag_add_relation_request_approved:
            "notifications.label.k-tag.relation.request.add.approved"
        case .k_tag_delete_relation_request_approved:
            "notifications.label.k-tag.relation.request.delete.approved"
    }
  }

  public func notificationKey() -> String {
    switch self {
    case .status:
      "notifications.label.status.push"
    case .mention:
      ""
    case .reblog:
      "notifications.label.reblog.push"
    case .follow:
      "notifications.label.follow.push"
    case .follow_request:
      "notifications.label.follow-request.push"
    case .favourite:
      "notifications.label.favorite.push"
    case .poll:
      "notifications.label.poll.push"
    case .update:
      "notifications.label.update.push"
        case .k_tag_add_relation_request:
            "notifications.label.k-tag.add.push"
        case .k_tag_delete_relation_request:
            "notifications.label.k-tag.delete.push"
        case .follow_k_tag:
            "notifications.label.k-tag.follow.push"
        case .k_tag_add_relation_request_denied:
            "notifications.label.k-tag.request.add.denied.push"
        case .k_tag_delete_relation_request_denied:
            "notifications.label.k-tag.request.delete.denied.push"
        case .k_tag_add_relation_request_approved:
            "notifications.label.k-tag.request.add.approved.push"
        case .k_tag_delete_relation_request_approved:
            "notifications.label.k-tag.request.delete.approved.push"
    }
  }

  func icon(isPrivate: Bool) -> Image {
    if isPrivate {
      return Image(systemName: "tray.fill")
    }
    switch self {
    case .status:
      return Image(systemName: "pencil")
    case .mention:
      return Image(systemName: "at")
    case .reblog:
      return Image("Rocket.Fill")
    case .follow, .follow_request:
      return Image(systemName: "person.fill.badge.plus")
    case .favourite:
      return Image(systemName: "star.fill")
    case .poll:
      return Image(systemName: "chart.bar.fill")
    case .update:
      return Image(systemName: "pencil.line")
        case .k_tag_add_relation_request:
            return Image(systemName: "tag.fill")
        case .k_tag_delete_relation_request:
            return Image(systemName: "tag.slash")
        case .follow_k_tag:
            return Image(systemName: "tag")
        case .k_tag_add_relation_request_denied:
            return Image(systemName: "tag.square")
        case .k_tag_delete_relation_request_denied:
            return Image(systemName: "tag.square.fill")
        case .k_tag_add_relation_request_approved:
            return Image(systemName: "tag.circle")
        case .k_tag_delete_relation_request_approved:
            return Image(systemName: "tag.slash")
    }
  }

  @MainActor
  func tintColor(isPrivate: Bool) -> Color {
    if isPrivate {
      return Color.orange.opacity(0.80)
    }
    switch self {
        case .status, .mention, .update, .poll, .k_tag_add_relation_request, .k_tag_delete_relation_request, .k_tag_delete_relation_request_approved, .k_tag_add_relation_request_approved,
                .k_tag_delete_relation_request_denied,
                .k_tag_add_relation_request_denied
            :
      return Theme.shared.tintColor.opacity(0.80)
    case .reblog:
      return Color.teal.opacity(0.80)
        case .follow, .follow_request, .follow_k_tag:
      return Color.cyan.opacity(0.80)
    case .favourite:
      return Color.yellow.opacity(0.80)
    }
  }

  func menuTitle() -> LocalizedStringKey {
    switch self {
    case .status:
      "notifications.menu-title.status"
    case .mention:
      "notifications.menu-title.mention"
    case .reblog:
      "notifications.menu-title.reblog"
    case .follow:
      "notifications.menu-title.follow"
    case .follow_request:
      "notifications.menu-title.follow-request"
    case .favourite:
      "notifications.menu-title.favorite"
    case .poll:
      "notifications.menu-title.poll"
    case .update:
      "notifications.menu-title.update"
    case .k_tag_add_relation_request:
        "notifications.menu-title.k-tag.request.add"
    case .k_tag_delete_relation_request:
        "notifications.menu-title.k-tag.request.delete"
    case .follow_k_tag:
        "notifications.menu-title.k-tag.follow"
    case .k_tag_add_relation_request_denied,.k_tag_delete_relation_request_denied
        ,.k_tag_add_relation_request_approved, .k_tag_delete_relation_request_approved:
        "notifications.menu-title.k-tag.request"
    }
  }
}
