//
//  PhotosCollectionViewCell.swift
//  camera2
//
//  Created by Abdur Razzak on 16/10/23.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageBGView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageBGView.layer.cornerRadius = 10.0
    }
    
    //  to get Photo Data
    func getPhotoData(images: UIImage?) {
        guard let image = images else { return }
        
        photoImageView.image = image
    }
    
}
