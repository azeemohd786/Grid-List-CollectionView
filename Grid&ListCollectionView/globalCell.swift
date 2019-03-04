//
//  globalCell.swift
//  Grid&ListCollectionView
//
//  Created by Mohammed Azeem Azeez on 04/03/2019.
//  Copyright © 2019 Riverswave Technologies Ltd. All rights reserved.
//

import UIKit

class globalCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var cardView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 3
        imageView.layer.masksToBounds = true
        label.layer.cornerRadius = 3
        label.layer.masksToBounds = true
        cardView.layer.cornerRadius = 3
        cardView.layer.masksToBounds = true
    }
}
