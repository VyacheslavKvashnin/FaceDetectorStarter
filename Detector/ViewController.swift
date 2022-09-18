//
//  ViewController.swift
//  Detector
//
//  Created by Gregg Mojica on 8/21/16.
//  Copyright © 2016 Gregg Mojica. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {
    @IBOutlet weak var personPic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personPic.image = UIImage(named: "face-1")

    }
    
    func detect() {
        
        guard let personciImage = CIImage(image: personPic.image!) else {
            return
        }

        let accuracy = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: accuracy)
        let faces = faceDetector!.features(in: personciImage)
        
        for face in faces as! [CIFaceFeature] {
            
            print("Found bounds are \(face.bounds)")
            
            let faceBox = UIView(frame: face.bounds)

            faceBox.layer.borderWidth = 3
            faceBox.layer.borderColor = UIColor.red.cgColor
            faceBox.backgroundColor = UIColor.clear
            personPic.addSubview(faceBox)
            
            if face.hasLeftEyePosition {
                print("Left eye bounds are \(face.leftEyePosition)")
            }
            
            if face.hasRightEyePosition {
                print("Right eye bounds are \(face.rightEyePosition)")
            }
        }
    }
}
