//
//  InitViewController.swift
//  TextRecognition
//
//  Created by Owner on 2023/07/30.
//

import UIKit

class InitViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func recognizeImage() {
        imageView.image = image
        guard let image else { return }
        TextRecognition.recognize(view: self.view, uiImage: image)
    }

}
