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
    public enum RequestStatus : Int, Codable, Sendable{
        case NotDecided
        case Approved
        case Deny
    }
    public let requestStatus: RequestStatus
    
    public let statusId: String
//    public let description: String

}
