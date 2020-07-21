//
//  PostView.swift
//  dcard
//
//  Created by Lova on 2020/4/27.
//  Copyright © 2020 lova. All rights reserved.
//

import Combine
import FetchSwift
import SwiftUI
import KingfisherSwiftUI

struct PostView: View {
    @State var post: Post?
    @State var comments: [Comment] = []
    @State var task: AnyCancellable?
    @State var commentsTask: AnyCancellable?

    var pictures: [URL] { self.post?.content?.urls() ?? [] }
//    var pictures: [URL] { self.post?.media?.compactMap { URL(string: $0.url ?? "") } ?? [] }
//    var pictures: [URL] { self.post?.mediaMeta?.compactMap { URL(string: $0.normalizedURL ?? "") } ?? [] }

    var body: some View {
        HStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(self.post?.createdAt ?? "")
                        .padding()

                    Text(self.post?.content ?? "")
                        .padding(.horizontal)

                    ForEach(pictures, id: \.absoluteString) { picture in
                        KFImage(picture)
//                        FetchImage(picture)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                            .frame(maxHeight: 800)
                    }

                    VStack(alignment: .leading) {
                        ForEach(comments, id: \.id) { comment in
                            Text("\(comment.school ?? "") -> \(comment.content ?? "")")
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                guard let id = self.post?.id else {
                    return
                }

                self.task = DcardAPI.shared.post(id: id).assign(to: \.post, on: self)

                guard let commentsCount = self.post?.commentCount, commentsCount > 0 else {
                    return
                }

                self.commentsTask = DcardAPI.shared.comments(id: id, offset: 0).print().assign(to: \.comments, on: self)
            }
//            .print(pictures)
            .print(comments)
        }
        .navigationBarTitle(Text(post?.title ?? ""), displayMode: .inline)
        .navigationBarItems(trailing: trailingItem())
    }

    func trailingItem() -> some View {
        Button(action: {
            guard let id = self.post?.id, let url = URL(string: "https://www.dcard.tw/f/beauty/p/\(id)") else {
                return
            }
            UIApplication.shared.open(url, completionHandler: nil)
        }) {
            Text("Link to post")
        }
        .accessibility(hint: Text("Just say hi"))
        .accessibility(identifier: "helloWorld")
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Mock.post)
            .previewDevice("iPhone 11 Pro")
    }
}
