//
//  ViewController.swift
//  a425HelloColletionView
//
//  Created by 申潤五 on 2021/5/9.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var theCollectionView: UICollectionView!
    
    var images:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        images = [
            UIImage(named: "image1")!,
            UIImage(named: "image2")!,
            UIImage(named: "image3")!,
            UIImage(named: "image4")!,
            UIImage(named: "image5")!,
            UIImage(named: "image6")!
        ]
        theCollectionView.dataSource = self
        theCollectionView.delegate = self
        
    }

    //MARK:CollectionView DataSource Delegate
    func collectionView(_ collectionView: UICollectionView,
    numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        cell.theImageView.image = images[indexPath.row]
        
        cell.backgroundColor = UIColor.red
        return cell
    }
    
}

