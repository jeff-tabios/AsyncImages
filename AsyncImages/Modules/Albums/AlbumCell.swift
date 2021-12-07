//
//  AlbumCell.swift
//  AsyncImages
//
//  Created by Jeffrey Tabios on 12/6/21.
//

import Foundation
import UIKit

class AlbumCell: UICollectionViewCell {
    
    @IBOutlet weak var albumImage: CustomImageView!
    
    override func prepareForReuse() {
        albumImage.image = nil
    }
}
