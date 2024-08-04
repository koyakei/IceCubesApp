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
    @State private var reviewComment: String = ""
  public var body: some View {
      HStack {
          TextField("Search", text: $reviewComment)
              .padding()
              .background(Color(.systemGray6))
              .cornerRadius(8)
              .padding()
          Text(kTagAddRelationRequest.kTag.name)
          if kTagAddRelationRequest.requestStatus == KTagAddRelationRequestForUser.RequestStatus.NotDecided{
              if kTagAddRelationRequest.requestStatus != KTagAddRelationRequestForUser.RequestStatus.Approved{
                  Button(action: {
                      Task{
                          kTagAddRelationRequest = try await client.post(endpoint: KTagAddRelationRequests.approve(id: kTagAddRelationRequest.id, reviewComment: reviewComment))
                      }
                  }){
                      Text("承認")
                  }
              }
              if kTagAddRelationRequest.requestStatus != KTagAddRelationRequestForUser.RequestStatus.Deny{
                  
                  Button(action: {
                      Task{
                          kTagAddRelationRequest = try await client.post(endpoint: KTagAddRelationRequests.deny(id: kTagAddRelationRequest.id, reviewComment: reviewComment))
                      }
                  }){
                      Text("拒否")
                  }
              }
          } else {
              Text("審査済み")
          }
      }
      .buttonStyle(.bordered)
      .padding(.top, 4)
    
    HStack {
        
    }
  }
}
