//
//  ContentView.swift
//  dcard
//
//  Created by Lova on 2020/4/26.
//  Copyright © 2020 lova. All rights reserved.
//

import Combine
import FetchSwift
import SwiftUI

struct PostsView: View {
    @State var posts: [Post] = []

    @State var task: AnyCancellable?

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(self.posts, id: \.id) { post in
                        NavigationLink(destination: PostView(post: post)) {
                            Cell(post: post)
                                .frame(height: 80)
                        }
                    }

                    Button("Loading More ...", action: self.loadMore)
                        .onAppear(perform: self.loadMore)
                }
            }
            .navigationBarTitle(DcardAPI.board)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    func loadMore() {
        self.task?.cancel()
        self.task = DcardAPI.shared.posts(lastId: self.posts.last?.id).sink {
            self.posts.append(contentsOf: $0)
        }
    }
}

struct Cell: View {
    var post: Post

    var url: URL? {
        URL(string: self.post.mediaMeta?.first?.thumbnail ?? "")
    }

    var body: some View {
        HStack {
//            KFImage(url)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 80, height: 60)
//                .clipped()

            VStack(alignment: .leading) {
                Text(post.title ?? "")
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(1)

                Text(post.excerpt ?? "")
                    .font(.body)
                    .lineLimit(3)
                    .padding(.top, 8)

                HStack {
                    Image(systemName: "suit.heart")
                    Text("\(post.likeCount ?? 0)")

                    Spacer().frame(width: 16)

                    Image(systemName: "message")
                    Text("\(post.commentCount ?? 0)")
                }.font(.footnote)
                    .padding(.top, 4)

                Spacer()
            }
            .padding(.leading)
        }
        .accessibility(hint: Text(post.excerpt ?? ""))
        .accessibility(identifier: "\(post.id)")
    }
}

struct PostViews_Previews: PreviewProvider {
    static var previews: some View {
        PostsView(posts: [Mock.post])
//            .allPreviewDevices()
    }
}
