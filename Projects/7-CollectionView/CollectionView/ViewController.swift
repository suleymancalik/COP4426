//
//  ViewController.swift
//  CollectionView
//
//  Created by Suleyman Calik on 29/04/15.
//  Copyright (c) 2015 BAU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var images = [UIImage]()
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        
    }
    
    
    @IBAction func addPhoto(sender: UIBarButtonItem) {
        
        // Photo Library'yi açıyoruz
        imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        presentViewController(imagePicker, animated:true, completion:nil)
    }
    
}


extension ViewController:UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("PhotoCell", forIndexPath:indexPath) as! PhotoCell
        
        cell.photo.image = images[indexPath.item]
        
        return cell
        
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        println("Fotoğraf seçildi!")
        
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            images.append(selectedImage)
            collectionView.reloadData()
        }
        
        // Photo albüm ekranını kapatıyoruz
        dismissViewControllerAnimated(true, completion:nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        println("Fotoğraf seçim iptal edildi!")
        
        // Photo albüm ekranını kapatıyoruz
        dismissViewControllerAnimated(true, completion:nil)
    }
    
    
}












