//
//  ImageSources.swift
//  a425HelloColletionView
//
//  Created by 申潤五 on 2021/5/9.
//

import UIKit

class ImageSources:NSObject,UICollectionViewDataSource{
    
    
    
    //MARK:CollectionView DataSource Delegate
    func collectionView(_ collectionView: UICollectionView,
    numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath)
        
        cell.backgroundColor = UIColor.red
        return cell
    }
    

}
