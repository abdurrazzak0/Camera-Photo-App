//
//  ViewController.swift
//  camera2
//
//  Created by Abdur Razzak on 15/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var picImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func photosButtonAction(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "photosVC") as! PhotosViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func cameraButtonAction(_ sender: Any) {
        
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Camera") as? ViewController else {
            return
        }
        
        
        
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        picImageView.image = image
    }
}
