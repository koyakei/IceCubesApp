//
//  KTagAddRequestButtons.swift
//  Notifications
//
//  Created by keisuke koyanagi on 2024/07/22.
//
import Foundation
import SwiftUI
import Models
import Network

@MainActor
public struct KTagAddRequestButtons: View {
    @Environment(Client.self) private var client
    
    @State var kTagAddRelationRequest: KTagAddRelationRequestForUser

  public var body: some View {
      HStack {
          Text(kTagAddRelationRequest.kTag.name)
          
          if kTagAddRelationRequest.requestStatus != KTagAddRelationRequestForUser.RequestStatus.Approved{
              Button(action: {
                  Task{
                      kTagAddRelationRequest = try await client.post(endpoint: KTagAddRelationRequests.approve(id: kTagAddRelationRequest.id))
                  }
              }){
                  Text("承認")
              }
          }
          if kTagAddRelationRequest.requestStatus != KTagAddRelationRequestForUser.RequestStatus.Deny{
              
              Button(action: {
                  Task{
                      kTagAddRelationRequest = try await client.post(endpoint: KTagAddRelationRequests.deny(id: kTagAddRelationRequest.id))
                  }
              }){
                  Text("拒否")
              }
          }
      }
      .buttonStyle(.bordered)
      .padding(.top, 4)
    
    HStack {
        
    }
  }
}
