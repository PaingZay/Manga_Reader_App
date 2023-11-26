//
//  HomeVC.swift
//  EZBook
//
//  Created by Paing Zay on 18/11/23.
//

import UIKit
import Kingfisher

class HomeVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var recentReleaseCollectionView: UICollectionView!
    @IBOutlet weak var mostPopularColletionView: UICollectionView!
    @IBOutlet weak var comingSoonCollectionView: UICollectionView!
    @IBOutlet weak var profilePicture: UIImageView!
    
    var imageArray = [UIImage(named: "NormalPunch"),UIImage(named: "Book002"),UIImage(named: "Book003")]
    
    var comingSoonArray = [UIImage(named: "FubukiCover"),UIImage(named: "FubukiCover"),UIImage(named: "FubukiCover"),UIImage(named: "FubukiCover")]
    
    var recentReleaseArray = [UIImage(named: "Genos1"),UIImage(named: "Genos2"),UIImage(named: "Genos3")]
    
    var mangaManager = MangaManager()
    
    
    
    var fetchedMangas: [MangaModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "EZBooks"
        
        profilePicture.layer.cornerRadius = 10 // Set your desired corner radius
        profilePicture.clipsToBounds = true// Do any additional setup after loading the view.
        
        //CarouselViewRegistration
        mostPopularColletionView.dataSource = self
        mostPopularColletionView.delegate = self
        
        mostPopularColletionView.register(UINib(nibName: "CarouselCell", bundle: nil), forCellWithReuseIdentifier: "CarouselCellIdentifier")
        //End
        
        //ComingSoonViewRegistration
        comingSoonCollectionView.dataSource = self
        comingSoonCollectionView.delegate = self
        comingSoonCollectionView.register(UINib(nibName: "CarouselCell2", bundle: nil), forCellWithReuseIdentifier: "CarouselCellIdentifier2")
        //End
        
        //RecentRelease
        recentReleaseCollectionView.dataSource = self
        recentReleaseCollectionView.delegate = self
        recentReleaseCollectionView.register(UINib(nibName: "CarouselCell2", bundle: nil), forCellWithReuseIdentifier: "CarouselCellIdentifier2")
        //End
        
        
        //The following is API fetching
        mangaManager.delegate = self
        mangaManager.fetchBooks()
//      mangaManager.delegate = self /* FOUND THE ERROR I DUNNO WHY self declaration as delegate after fetching api has issues */
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (collectionView == mostPopularColletionView) {
            return imageArray.count
        }
            
        if (collectionView == comingSoonCollectionView) {
            return comingSoonArray.count
        }
        
        if (collectionView == recentReleaseCollectionView) {
//            return recentReleaseArray.count
            return fetchedMangas.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let defaultCell = UICollectionViewCell()
        
        if (collectionView == recentReleaseCollectionView) {
            guard let cell2 = recentReleaseCollectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCellIdentifier2", for: indexPath) as? CarouselCell2 else {
                fatalError("Unable to dequeue CustomCollectionViewCell")
            }
            
//            cell2.coverImage.image = recentReleaseArray[indexPath.row]
            
            if let coverImageUrl = fetchedMangas[indexPath.row].coverImage {
//                print("Now Loading")
                let resource = KF.ImageResource(downloadURL: URL(string: coverImageUrl)!, cacheKey: coverImageUrl)
                cell2.coverImage.kf.setImage(with: resource)
            }
            return cell2
        }
        
        if (collectionView == mostPopularColletionView) {
            guard let cell1 = mostPopularColletionView.dequeueReusableCell(withReuseIdentifier: "CarouselCellIdentifier", for: indexPath) as? CarouselCell else {
                fatalError("Unable to dequeue CustomCollectionViewCell")
            }
            cell1.coverImage.image = imageArray[indexPath.row]
            return cell1
        }
        
        if (collectionView == comingSoonCollectionView) {
            guard let cell2 = comingSoonCollectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCellIdentifier2", for: indexPath) as? CarouselCell2 else {
                fatalError("Unable to dequeue CustomCollectionViewCell")
            }
            cell2.coverImage.image = comingSoonArray[indexPath.row]
            return cell2
        }
        
        return defaultCell
    }
}

extension HomeVC: MangaDelegate {
    func didFailedWithError(error: Error) {
        print("There is no data returned from the model")
    }

    func didUpdateMangas(_ MangaManager: MangaManager, mangas: [MangaModel]) {
        fetchedMangas = mangas
        DispatchQueue.main.async {
            self.recentReleaseCollectionView.reloadData()
        }
    }
}
