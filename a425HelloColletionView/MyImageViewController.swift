//
//  MyImageViewController.swift
//  a425HelloColletionView
//
//  Created by 申潤五 on 2021/5/9.
//

import UIKit

class MyImageViewController: UIViewController {

    @IBOutlet weak var theImageView: UIImageView!
    var selectedImage:UIImage? = nil
    
    var nextImage:(()->())? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.theImageView.image = selectedImage
    }
    
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func callBack1(_ sender: Any) {
        nextImage?()
    }
    
}
