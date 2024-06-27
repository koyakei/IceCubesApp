//
//  File.swift
//  
//
//  Created by keisuke koyanagi on 2024/06/12.
//

import Foundation
import SwiftUI
import Network
import Models
struct KTagSearchAndAddView : View, Sendable {
    @State private var searchText = ""
    @ObservedObject var viewModel: KTagWithRelationListViewModel
    @State var selectedTag:[KTag] = []
    @State var client: Client
    // 検索結果のフィルタリング
    @State var searchResults: [KTag] = []
    func fetchSearchResults() async {
                
                do {
                    searchResults = try await client.get(endpoint: KTagRequests.search(query: searchText, type: nil, offset: nil, following: nil))
                } catch {
//                    searchResults = []
                }
            }
    var body: some View {
        VStack {
            // 検索バー
            TextField("Search", text: $searchText)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding()
                .onChange(of: searchText) {
                    Task {
                        await fetchSearchResults()
                    }
                }
            // 検索候補の表示
            if !searchText.isEmpty {
                List {
                    ForEach(searchResults) { tag in
                        Button(action: {
                            Task{
                                await viewModel.addKTagRelationRequest(tagId: tag.id)
                            }
                            self.selectedTag.append(tag)
                        }) {
                            Text(tag.name)
                        }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                }
                .listStyle(PlainListStyle())
            }
            
            // 選択されたタグの表示 追加候補になったら追加
            if !self.selectedTag.isEmpty {
                Text("Selected Tags:")
                    .font(.headline)
                    .padding(.top)
                
                ForEach(selectedTag) { tag in
                    Button(action: {
                        viewModel.del(tagId: tag.id)
                        selectedTag.removeAll(where: {$0.id == tag.id})
                    }) {
                        Text(tag.name)
                            .padding(4)
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
            }
            
            Spacer()
        }.onAppear(perform: {
            selectedTag = viewModel.kTags
        })
//        .onDisappear(perform: {
//            //selectedTag - viewModel.kTags
//            // 差分を反映する。　無くなったタグを消去リクエスト　追加するタグを追加リクエスト
//            selectedTag.filter { elementA in
//                !viewModel.kTags.contains(where: { elementB in
//                    elementB == elementA
//                })}.map{viewModel.addKTagRelationRequest(tag: $0)}
//        })
    }
}

struct KTagWithRelationListView: View {
    @State var viewModel: KTagWithRelationListViewModel
    var client: Client?
    @State private var showAlert = false
   
    // stream から削除信号が来たらタグを消す
    var body: some View {
        HStack{
//            /
        }
    }
    
    func color(_ tag: any NotIdentifiedKTagAddRelationRequestDataProtocol) -> Color {
        switch tag {
            case is AddingKTagRelationRequested:
                if (tag.isOwned){
                    return .purple
                } else{
                    return .blue
                }
            case is DeletingKTagRelationRequested:
                if (tag.isOwned){
                    return .red
                } else{
                    return .yellow
                }
        case is AddedKTagRelation:
            return .clear // Doubleの場合は緑色
        default:
                return .clear // 他の型の場合は灰色
        }
    }
    }

