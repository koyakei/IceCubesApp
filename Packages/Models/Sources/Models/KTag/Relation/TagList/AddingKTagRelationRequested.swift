//
//  File.swift
//  
//
//  Created by keisuke koyanagi on 2024/06/15.
//

import Foundation
public struct AddingKTagRelationRequested :NotCreatedYetKTagRelationForSearchAndAddProtocol, Sendable{
  
    public let statusId: String
    public let accountId: String
    public let kTagId: String
    public let kTag: KTag
    public let addRequestId: String
    public let isOwned: Bool
    init(kTagId: String,statusId:String ,accountId: String,kTag:KTag, isOwned: Bool,addRequestId: String) {
        self.statusId = statusId
        self.accountId = accountId
        self.kTag = kTag
        self.kTagId = kTagId
        self.isOwned = isOwned
        self.addRequestId = addRequestId
    }
}
