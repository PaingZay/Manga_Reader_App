//
//  File.swift
//  EZBook
//
//  Created by Paing Zay on 23/11/23.
//

import Foundation

protocol MangaDelegate {
    func didUpdateMangas(_ mangaManager: MangaManager, mangas:[MangaModel])
    func didFailedWithError(error: Error)
}

struct MangaManager {
    
    let baseAPIPath = "https://kitsu.io/api/edge"
    
    var delegate: MangaDelegate?
    
    func fetchBooks() {
        let url = "\(baseAPIPath)/manga?page[limit]=5&page[offset]=100"
        performRequest(urlString: url)
    }

func performRequest(urlString: String) {
    if let url = URL(string: urlString) {
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if let e = error {
                print(e)
                return
            }
            if let safeData = data {
                if let mangas = self.parseJSON(mangaData: safeData) {
                    self.delegate?.didUpdateMangas(self, mangas: mangas)
                }
            }
        }
        task.resume()
    }
}

func parseJSON(mangaData: Data) -> [MangaModel]? {
    let decoder = JSONDecoder()
    do {
        
        let decodedData = try decoder.decode(MangaData.self, from: mangaData)
        
        var mangas: [MangaModel] = []
        
        for manga in decodedData.data {
            let createdAt = manga.attributes.createdAt
            let updatedAt = manga.attributes.updatedAt
            let synopsis = manga.attributes.synopsis
            let description = manga.attributes.description
            let averageRating = manga.attributes.averageRating
            let title = manga.attributes.titles.en_jp
            let coverImage = manga.attributes.posterImage.medium

            let manga = MangaModel(createdAt: createdAt, updatedAt: updatedAt, synopsis: synopsis, description: description, averageRating: averageRating, title: title, coverImage: coverImage)

            mangas.append(manga)
        }
        return mangas
    } catch {
        print("MUDA\(error)")
        return nil
    }
}

}
