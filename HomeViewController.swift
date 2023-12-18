//
//  HomeViewController.swift
//  EZBook
//
//  Created by Paing Zay on 12/11/23.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    

    var imageArray = [UIImage(named: "Book001"),UIImage(named: "Book002"),UIImage(named: "Book003")]
    
    override func viewDidLoad() {   
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCollectionViewCell", for: indexPath) as! bookCollectionViewCell
        
        cell.bookImageView.image = imageArray[indexPath.row]
        return cell
    }
}
