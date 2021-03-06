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
    
    @IBOutlet weak var numberInLineSegment: UISegmentedControl!
    
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
        
 
        let numberInLine = CGFloat(numberInLineSegment.selectedSegmentIndex + 3)
        self.setCollctionViewLayout(numberInLine)
         
        
        
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        NotificationCenter.default.addObserver(self, selector: #selector(shouldRotateObject(_:)), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc func shouldRotateObject(_ sender:Any?){
        let numberInLine = CGFloat(numberInLineSegment.selectedSegmentIndex + 3)
        setCollctionViewLayout(numberInLine)
        print("rotate")
    }

    @IBAction func nilx(_ sender: Any) {
        let numberInLine = CGFloat(numberInLineSegment.selectedSegmentIndex + 3)
        setCollctionViewLayout(numberInLine)
    }
    
    
    
    
    
    func setCollctionViewLayout(_ numberOfItemInLine:CGFloat){
        //設定Collection Flow
        
        
        let layout = UICollectionViewFlowLayout()
        
        //取得畫面 safeArea 大小
        let viewsize = view.safeAreaLayoutGuide.layoutFrame.size
        // 設置 section 的間距 四個數值分別代表 上、左、下、右 的間距
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        // 設置每一行的間距
        layout.minimumLineSpacing = 5

        layout.itemSize = CGSize(width: viewsize.width / numberOfItemInLine - 10, height: viewsize.width / numberOfItemInLine - 10)
        
        
        theCollectionView.setCollectionViewLayout(layout, animated: true)
        
        
    }
    
    
    

    

    //MARK:CollectionView DataSource Delegate
    func collectionView(_ collectionView: UICollectionView,
    numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        cell.theImage.image = images[indexPath.row]
        
//        cell.backgroundColor = UIColor.red
        return cell
    }
    
    var index = 0
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("選了 \(indexPath)")
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let nextVC = storyBoard.instantiateViewController(identifier:  "myImageVC") as? MyImageViewController
        nextVC?.modalPresentationStyle = .fullScreen
        index = indexPath.row
        if let nextVC = nextVC{
            nextVC.selectedImage = images[indexPath.row]
            nextVC.nextImage = {
                print("nextImage")
                self.index += 1
                nextVC.theImageView.image = self.images[self.index % self.images.count]
            }
            
            
            self.present(nextVC, animated: true, completion: nil)
        }
        
    }
    
}

