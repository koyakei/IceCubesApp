//
//  KTagAddRequestView.swift
//  StatusKit
//
//  Created by keisuke koyanagi on 2024/07/22.
//

public struct KTagAddRelationRequestView : View{
    var kTagAddRelationRequestViewModel:KTagAddRelationRequestViewModel// notification
    var body: some View{
        VStack{
//            依頼内容
            Text(kTagAddRelationRequestViewModel.kTagAddRelationRequest.description)
//            ターゲット　ステート
            Text(kTagAddRelationRequestViewModel.kTagAddRelationRequest.status.spoilerText.asRawText)
//            タップしたら本物のツイートに遷移したい
//            タグ　名前　リンク
            Text(kTagAddRelationRequestViewModel.kTagAddRelationRequest.kTag.name)
//            オーナー名　リンク これは自分だからいらないか            Text(kTagAddRelationRequest.kTag.accountId)
            // 承認 承認済みなら消す
                if kTagAddRelationRequest.aproveDenyStatus != KTagAddRelationRequestForUser.ApproveDenyStatus.Approved{
                    
                    Button(action: {
                        kTagAddRelationRequestViewModel.approve()
                        //                client.approve(リクエストID)
                    }){
                        Text("承認")
                    }
                }
                // 拒否 済みなら消す
            if kTagAddRelationRequest.aproveDenyStatus != KTagAddRelationRequestForUser.ApproveDenyStatus.Deny{
                Button(action: {
                    //                client.deny(リクエストID)
                }){
                    Text("拒否")
                }
            }
            
        }
    }
}


