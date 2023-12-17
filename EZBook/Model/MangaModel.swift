//
//  BookModel.swift
//  EZBook
//
//  Created by Paing Zay on 23/11/23.
//

import Foundation

struct MangaModel: Codable {
    let id: String
    let createdAt: String
    let updatedAt: String
    let synopsis: String?
    let description: String?
    let averageRating: String?
    let title: String?
    let coverImage: String?
    var parsedAverageRating: Double? {
        return Double(averageRating ?? "0.0")
    }
    let popularityRank: Int?
    let userCount: Int
    let favoritesCount: Int
    let posterImage: String?
<<<<<<< HEAD
    let status: String
    let chapterCount: Int?
    let volumeCount: Int?
    let serialization: String?
=======
>>>>>>> 8bb0a74c143e2cda0a567a455eff5567147ce3c2
}
