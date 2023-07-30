//
//  RecognitionButton.swift
//  TextRecognition
//
//  Created by Owner on 2023/07/30.
//

import UIKit

class RecognitionButton: UIButton {

    var text: String = ""
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(text)
    }
}
