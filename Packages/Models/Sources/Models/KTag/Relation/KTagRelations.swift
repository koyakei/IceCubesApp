//
//  KTagRelations.swift
//  
//
//  Created by keisuke koyanagi on 2024/06/17.
//

import Foundation

public struct KTagRelations: Codable, Sendable{
    public var addedKTagRelationList: Set<AddedKTagRelation>
    public var addingKTagRelationRequestedList: Set<AddingKTagRelationRequested>
    public var deletingKTagRelationRequestedList: Set<DeletingKTagRelationRequested>
    
    public init(addedKTagRelationList: Set<AddedKTagRelation>,
                addingKTagRelationRequestedList: Set<AddingKTagRelationRequested>,
                deletingKTagRelationRequestedList: Set<DeletingKTagRelationRequested>) {
        self.addedKTagRelationList = addedKTagRelationList
        self.addingKTagRelationRequestedList = addingKTagRelationRequestedList
        self.deletingKTagRelationRequestedList = deletingKTagRelationRequestedList
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        print("KTagRelations　Container contents:")
            for key in container.allKeys {
                print("\(key.stringValue)")
                
            }
        do {
            self.addedKTagRelationList = try container.decode(Set<AddedKTagRelation>.self, forKey: .addedKTagRelationList)
        } catch {
            print("KTagRelationsDecoding error: \(error)")
            print(container)
            self.addedKTagRelationList = Set<AddedKTagRelation>()
            // エラーハンドリングのコードをここに追加
        }
        
        self.addingKTagRelationRequestedList = try container.decodeIfPresent(Set<AddingKTagRelationRequested>.self, forKey: .addingKTagRelationRequestedList) ?? Set<AddingKTagRelationRequested> ()
        self.deletingKTagRelationRequestedList = try container.decodeIfPresent(Set<DeletingKTagRelationRequested>.self, forKey: .deletingKTagRelationRequestedList) ?? Set<DeletingKTagRelationRequested> ()
    }
    
    public mutating func remove(_ tagAndRelation: AddedKTagRelation){
        addedKTagRelationList.remove(tagAndRelation)
        addingKTagRelationRequestedList = addingKTagRelationRequestedList.filter{
            !($0.kTagId == tagAndRelation.kTagId && $0.statusId == tagAndRelation.statusId)
        }
        deletingKTagRelationRequestedList = deletingKTagRelationRequestedList.filter{
            !($0.kTagId == tagAndRelation.kTagId && $0.statusId == tagAndRelation.statusId)
        }
    }
    
    public mutating func remove(_ tagAndRelation: AddingKTagRelationRequested){
        addingKTagRelationRequestedList.remove(tagAndRelation)
        addedKTagRelationList = addedKTagRelationList.filter{
            !($0.kTagId == tagAndRelation.kTagId && $0.statusId == tagAndRelation.statusId)
        }
        deletingKTagRelationRequestedList = deletingKTagRelationRequestedList.filter{
            !($0.kTagId == tagAndRelation.kTagId && $0.statusId == tagAndRelation.statusId)
        }
    }
    
    public mutating func remove(_ tagAndRelation: DeletingKTagRelationRequested){
        addingKTagRelationRequestedList = addingKTagRelationRequestedList.filter{
            !($0.kTagId == tagAndRelation.kTagId && $0.statusId == tagAndRelation.statusId)
        }
        addedKTagRelationList = addedKTagRelationList.filter{
            !($0.kTagId == tagAndRelation.kTagId && $0.statusId == tagAndRelation.statusId)
        }
        deletingKTagRelationRequestedList.remove(tagAndRelation)
    }
    
    public mutating func update(_ tagAndRelation: AddedKTagRelation){
        addedKTagRelationList.update(with: tagAndRelation)
    }
    
    public mutating func update(_ tagAndRelation:AddingKTagRelationRequested){
        addingKTagRelationRequestedList.update(with: tagAndRelation)
    }
    public mutating func update(_ tagAndRelation: DeletingKTagRelationRequested){
        deletingKTagRelationRequestedList.update(with: tagAndRelation)    }
}
