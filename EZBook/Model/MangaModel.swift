//
//  BookModel.swift
//  EZBook
//
//  Created by Paing Zay on 23/11/23.
//

import Foundation

struct MangaModel: Codable {
    let createdAt: String
    let updatedAt: String
    let synopsis: String?
    let description: String?
    let averageRating: String?
    let title: String?
    let coverImage: String?
}
