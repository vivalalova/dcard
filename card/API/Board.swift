//
//  Board.swift
//  dcard
//
//  Created by Lova on 2020/5/1.
//  Copyright © 2020 lova. All rights reserved.
//

import Foundation

struct Board: Codable {
    var id: String?
    var alias: String?
    var name: String?
    var welcomeDescription: String?
    var subscriptionCount: Int?
    var subscribed: Bool?
    var read: Bool?
    var createdAt: String?
    var updatedAt: String?
    var canPost: Bool?
    var ignorePost: Bool?
    var invisible: Bool?
    var isSchool: Bool?
    var fullyAnonymous: Bool?
    var canUseNickname: Bool?
    var postThumbnail: PostThumbnail?
    var shouldCategorized: Bool?
    var shouldPostCategorized: Bool?
    var titlePlaceholder: String?
    var postTitlePlaceholder: String?
    var topics: [String]?
    var nsfw: Bool?
//    var limitCountries: [Any?]?
    var limitStage: Int?
    var availableLayouts: [String]?
    var postCount: PostCount?
    var favorite: Bool?

//    var subcategories: [Any?]?
//    var ipCountryCondition: IPCountryCondition?
//    var mediaThreshold: IPCountryCondition?
}

// MARK: - IPCountryCondition

// struct IPCountryCondition: Codable, Hashable {}

// MARK: - PostCount

struct PostCount: Codable {
    var last30Days: Int?
}

// MARK: - PostThumbnail

struct PostThumbnail: Codable {
    var size: String?
}
