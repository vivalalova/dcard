//
//  View+.swift
//  card
//
//  Created by Lova on 2020/7/21.
//

import SwiftUI

extension View {
    func print(_ vars: Any?...) -> some View {
        for v in vars {
            dump(v)
        }

        return self
    }
}
