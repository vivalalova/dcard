//
//  Comment.swift
//  dcard
//
//  Created by Lova on 2020/5/1.
//  Copyright © 2020 lova. All rights reserved.
//

import Foundation

struct Comment: Codable, Identifiable {
    var id: String?
    var anonymous: Bool?
    var postID: Int?
    var createdAt, updatedAt: String?
    var floor: Int?
    var content: String?
    var likeCount: Int?
    var withNickname, hiddenByAuthor: Bool?
    var meta: Meta?
    var gender, school: String?
    var host: Bool?
    var reportReason: String?
    var mediaMeta: [MediaMeta]?
    var hidden, inReview: Bool?
    var reportReasonText: String?
    var isSuspiciousAccount: Bool?
    var postAvatar: String?
}
