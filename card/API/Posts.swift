//
//  Posts.swift
//  dcard
//
//  Created by Lova on 2020/4/27.
//  Copyright © 2020 lova. All rights reserved.
//

import Foundation

// MARK: - Welcome

struct Post: Codable, Identifiable {
    var id: Int = 0
    var title, content, excerpt: String?
    var anonymousSchool: Bool?
    var anonymousDepartment: Bool?
    var pinned: Bool?
    var forumID: String?
    var replyID: String?
    var createdAt: String
    var updatedAt: String?
    var commentCount: Int?
    var likeCount: Int?
    var withNickname: Bool?
    var tags: [String]?
    var topics: [String]?
    var meta: Meta?
    var forumName: String?
    var forumAlias: String?
    var nsfw: Bool?
    var gender: String?
    var replyTitle: String?
    var mediaMeta: [MediaMeta]?
    var reactions: [Reaction]?
    var hidden: Bool?
    var customStyle: String?
    var isSuspiciousAccount: Bool?
    var layout: String?
    var withImages: Bool?
    var withVideos: Bool?
    var media: [Media]?
    var reportReasonText: String?
    var postAvatar: String?

    var supportedReactions: [String]?

    var reportReason: String?
    var hiddenByAuthor: Bool?
    var personaSubscriptable: Bool?
}

// MARK: - Media

struct Media: Codable {
    var url: String?
}

// MARK: - MediaMeta

struct MediaMeta: Codable {
    var id: String?
    var url: String?
    var normalizedURL: String?
    var thumbnail: String?
    var type: String?
    var tags: [String]?
    var createdAt, updatedAt: String?
    var width, height: Int?
}

// MARK: - Meta

struct Meta: Codable {
    var layout: String?
    var disableAdSense: Bool?
}

// MARK: - Reaction

struct Reaction: Codable {
    var id: String?
    var count: Int?
}
