//
//  Menu.swift
//  dcard
//
//  Created by Lova on 2020/5/1.
//  Copyright © 2020 lova. All rights reserved.
//

import Combine
import SwiftUI

struct MenuView: View {
    @State var boards: [Board] = []
    @State var task: AnyCancellable?

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(self.boards, id: \.id) { board in
                        Text(board.name ?? "")
                    }
                }
            }
            .navigationBarTitle(DcardAPI.board)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            self.task = DcardAPI.shared.fourm().assign(to: \.boards, on: self)
        }
    }
}

 struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .previewDevice("iPhone 11 Pro")
    }
 }
