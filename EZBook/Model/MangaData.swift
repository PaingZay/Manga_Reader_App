//
//  BookData.swift
//  EZBook
//
//  Created by Paing Zay on 23/11/23.
//

import Foundation

struct MangaData: Codable {
    let data: [Manga]
}

struct SingleMangaData: Codable {
    let data: Manga
}

struct Manga: Codable {
    let id: String
    let type: String
    let attributes: MangaAttributes
}

struct MangaAttributes: Codable {
    let createdAt: String
    let updatedAt: String
//    let slug: String
    let synopsis: String?
    let description: String?
//    let coverImageTopOffset: Int
    let titles: MangaTitles
//    let canonicalTitle: String
//    let abbreviatedTitles: [String]
    let averageRating: String?
    let userCount: Int
    let favoritesCount: Int
//    let startDate: String
//    let endDate: String?
//    let nextRelease: String?
    let popularityRank: Int
//    let ratingRank: Int
//    let ageRating: String?
//    let ageRatingGuide: String?
//    let subtype: String
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> a8547ff5a991e3f05a5aefa14821f16f792564cc
    let status: String
    let chapterCount: Int?
    let volumeCount: Int?
    let serialization: String?
<<<<<<< HEAD
=======
=======
//    let status: String
>>>>>>> 8bb0a74c143e2cda0a567a455eff5567147ce3c2
>>>>>>> a8547ff5a991e3f05a5aefa14821f16f792564cc
//    let tba: String?
    let coverImage: MangaCoverImage?
    let posterImage: MangaPosterImage
}

struct MangaTitles: Codable {
    let en: String?
    let en_jp: String?
    let en_us: String?
    let ja_jp: String?
}

struct MangaCoverImage: Codable {
    let large: String?
    let small: String?
    let medium: String?
    let original: String?
}

struct MangaPosterImage: Codable {
    let large: String?
    let small: String?
    let medium: String?
    let original: String?
}
