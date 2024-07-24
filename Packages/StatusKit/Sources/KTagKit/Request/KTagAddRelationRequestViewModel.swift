//
//  KTagAddRelationRequestViewModel.swift
//  
//
//  Created by keisuke koyanagi on 2024/07/22.
//
import Foundation

public struct KTagAddRelationRequestViewModel: Observable{
    
    @Environment(Client.self) private var client
    
    var kTagAddRelationRequest: KTagAddRelationRequestForUser
    
    func approve()  async{
        kTagAddRelationRequest = await try client.post(endpoint: KTagAddRelationRequests.approve(id: kTagAddRelationRequest.id))
    }
    
    func deny() async{
        kTagAddRelationRequest = await try client.post(endpoint: KTagAddRelationRequests.deny(id: kTagAddRelationRequest.id))
    }
    
    
}
