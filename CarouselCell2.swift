//
//  CarouselCell2.swift
//  EZBook
//
//  Created by Paing Zay on 19/11/23.
//

import UIKit

class CarouselCell2: UICollectionViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        coverImage.layer.cornerRadius = coverImage.frame.size.height / 15
    }

}
