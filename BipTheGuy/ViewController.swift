//
//  ViewController.swift
//  BipTheGuy
//
//  Created by John Pappas on 9/21/20.
//  Copyright © 2020 John Pappas. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var audioPlayer: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("Error: \(error.localizedDescription) Couldn't read data from sound file")
            }
        } else {
            print("Error: Couldn't read data from sound file")
        }
    }
    
    @IBAction func punchButtonPressed(_ sender: UIButton) {
        let originalFrame = imageView.frame
        let widthShrink: CGFloat = 20
        let heightShrink: CGFloat = 20
        let smallerFrame = CGRect(
            x: imageView.frame.origin.x + widthShrink,
            y: imageView.frame.origin.y + heightShrink,
            width: imageView.frame.width - (2 * widthShrink),
            height: imageView.frame.height - (2 * heightShrink))
        imageView.frame = smallerFrame
        playSound(name: "punchSound")
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, animations: {self.imageView.frame = originalFrame})
    }
    @IBAction func imagedTapped(_ sender: UITapGestureRecognizer) {
        let originalFrame = imageView.frame
        let widthShrink: CGFloat = 20
        let heightShrink: CGFloat = 20
        let smallerFrame = CGRect(
            x: imageView.frame.origin.x + widthShrink,
            y: imageView.frame.origin.y + heightShrink,
            width: imageView.frame.width - (2 * widthShrink),
            height: imageView.frame.height - (2 * heightShrink))
        imageView.frame = smallerFrame
        playSound(name: "punchSound")
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, animations: {self.imageView.frame = originalFrame})
    }
}

