//
//  KTagAddRelationRequestForUser.swift
//  Models
//
//  Created by keisuke koyanagi on 2024/07/22.
//

public struct KTagAddRelationRequestForUser:NotIdentifiedKTagAddRelationRequestDataProtocol, IdentifiedDataProtocol {
    public let id: String
    public var isOwned: Bool
    public var requester: Account
    public let kTagId: String
    public let kTag: KTag
    public enum DecisionStatus : Int, Codable, Sendable{
        case NotDecided
        case Approved
        case Deny
    }
    public let decisionStatus: DecisionStatus
    
    public let statusId: String
    public let status: Status
    public let description: String
}
