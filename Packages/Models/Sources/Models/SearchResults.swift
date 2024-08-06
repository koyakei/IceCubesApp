import Foundation

public struct SearchResults: Decodable {
  enum CodingKeys: String, CodingKey {
    case accounts, statuses, hashtags, kTags
  }

  public var accounts: [Account]
  public var relationships: [Relationship] = []
  public var statuses: [Status]
  public var hashtags: [Tag]
    public var kTags: [KTag]

  public var isEmpty: Bool {
    accounts.isEmpty && statuses.isEmpty && hashtags.isEmpty && kTags.isEmpty
  }
}

extension SearchResults: Sendable {}
