//
//  ViewController.swift
//  Photo
//
//  Created by Ryan Ruoshui Yan on 13/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBAction func importImage(_ sender: Any) {
        openPhotoLibrary()
    }
    
    func openPhotoLibrary() {
        let imagePickerControl = UIImagePickerController()
        imagePickerControl.delegate = self
        imagePickerControl.sourceType = UIImagePickerControllerSourceType.photoLibrary // Or .camera
        imagePickerControl.allowsEditing = false
        self.present(imagePickerControl, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            // Update UI
            imageView.image = image
        } else {
            print("Error!")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

