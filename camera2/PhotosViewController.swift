//
//  PhotosViewController.swift
//  camera2
//
//  Created by Abdur Razzak on 16/10/23.
//

import UIKit
import PhotosUI

class PhotosViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    private let photoCellIdentifier:String = "photoCell"
    
    var images:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupNav()
        
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        
        photoCollectionView.register(UINib(nibName: "PhotosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: photoCellIdentifier)
        
        
    }
    
    // MARK: - Function
    
    func setupNav() {
        self.navigationController?.delegate = self
        
        let addPlusButton = UIBarButtonItem(title: "Add Images",
                                            style: .plain,
                                            target: self,
                                            action: #selector(addPhotosAction))
        
        navigationItem.rightBarButtonItem = addPlusButton
    }
    
    @objc func addPhotosAction() {
        print("add Photo")
    }
    
    
}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCellIdentifier, for: indexPath) as? PhotosCollectionViewCell {
            cell.getPhotoData(images: images[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
}
extension PhotosViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                if let images = object as? UIImage {
                    self.images.append(images)
                }
                
                DispatchQueue.main.async {
                    self.photoCollectionView.reloadData()
                }
            }
        }
    }
}
