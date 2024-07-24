import Foundation

public struct Notification: Decodable, Identifiable, Equatable {
  public enum NotificationType: String, CaseIterable {
    case follow, follow_request, mention, reblog, status, favourite, poll, update, k_tag_add_relation_request,  k_tag_delete_relation_request, follow_k_tag, k_tag_add_relation_request_denied, k_tag_delete_relation_request_denied,
         k_tag_add_relation_request_approved, k_tag_delete_relation_request_approved
  }

  public let id: String
  public let type: String
  public let createdAt: ServerDate
  public let account: Account
  public let status: Status?
    public let kTagAddRealtionRequestForUser: KTagAddRelationRequestForUser?
    public let kTagDeleteRelationRequest: KTagDeleteRelationRequest?

  public var supportedType: NotificationType? {
    .init(rawValue: type)
  }

  public static func placeholder() -> Notification {
    .init(id: UUID().uuidString,
          type: NotificationType.favourite.rawValue,
          createdAt: ServerDate(),
          account: .placeholder(),
          status: .placeholder(),
          kTagAddRealtionRequestForUser: nil,
          kTagDeleteRelationRequest: nil
    )
  }
}

extension Notification: Sendable {}
extension Notification.NotificationType: Sendable {}
