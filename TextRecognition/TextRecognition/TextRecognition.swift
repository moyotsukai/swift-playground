//
//  TextRecognition.swift
//  TextRecognition
//
//  Created by Owner on 2023/07/30.
//

import UIKit
import Vision
import VisionKit

class TextRecognition {
    
    var orientation: CGImagePropertyOrientation?
    
    static func recognize(view: UIView, uiImage: UIImage) {
        
        for subview in view.subviews {
            view.willRemoveSubview(subview)
        }
        
        if let cgImage = uiImage.cgImage {
            let request = VNRecognizeTextRequest()
            request.recognitionLanguages = ["ja"] // 日本語を指定
            request.recognitionLevel = .accurate
            
            
            let handler = VNImageRequestHandler(cgImage: cgImage, orientation: CGImagePropertyOrientation(uiImage.imageOrientation))
            do {
                try handler.perform([request])
            } catch let error {
                print(error)
            }
            guard let observations = request.results else { return }
            
            let aspect = view.bounds.width / uiImage.size.width
            
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: uiImage.size.height * aspect))
            imageView.center = view.center
            imageView.image = uiImage
            view.addSubview(imageView)
            
            for observation in observations {
                let box = observation.boundingBox // 位置のボックス
                let topCandidate = observation.topCandidates(1)
                if let recognizedText = topCandidate.first?.string { // 検出したテキスト
                    let recognitionButton = RecognitionButton(
                        frame: CGRect(x: box.origin.x * imageView.bounds.width + imageView.frame.origin.x,
                                      y: (1 - box.origin.y - box.size.height) * imageView.bounds.height + imageView.frame.origin.y,
                                      width: box.width * imageView.bounds.width,
                                      height: box.height * imageView.bounds.height))
                    
                    recognitionButton.text = recognizedText
                    
                    recognitionButton.layer.borderWidth = 4
                    recognitionButton.layer.borderColor = UIColor.yellow.cgColor
                    recognitionButton.addTarget(self, action: #selector(printText), for: .touchUpInside)
                    view.addSubview(recognitionButton)
                }
            }
        }
    }
    
    @objc func printText() {
        
    }
    
}

extension CGImagePropertyOrientation {
    init(_ uiOrientation: UIImage.Orientation) {
        switch uiOrientation {
        case .up: self = .up
        case .upMirrored: self = .upMirrored
        case .down: self = .down
        case .downMirrored: self = .downMirrored
        case .left: self = .left
        case .leftMirrored: self = .leftMirrored
        case .right: self = .right
        case .rightMirrored: self = .rightMirrored
        default: self = .up
        }
    }
}
