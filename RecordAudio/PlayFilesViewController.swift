//
//  PlayFilesViewController.swift
//  RecordAudio
//
//  Created by jonathan tang on 10/27/15.
//  Copyright © 2015 jonathan tang. All rights reserved.
//

import UIKit
import AVFoundation

class PlayFilesViewController: UIViewController {
    
    @IBOutlet weak var stopClip: UIButton!
    
    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    var audioPlayerNode:AVAudioPlayerNode!
    var audioRatePitch:AVAudioUnitTimePitch!

//    function to play asset file
//    func playSoundFile() {
//        if let myAssetSound = NSDataAsset(name: "jiandanai") {
//            let soundFile = myAssetSound.data
//            do {
//                try audioPlayer = AVAudioPlayer(data: soundFile)
//            } catch {
//                print("NO AUDIO PLAYER")
//            }
//            audioPlayer?.prepareToPlay()
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
        audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)
        audioPlayer = try! AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
        audioPlayer.enableRate = true
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func snailButton(sender: UIButton) {
        audioPlayer?.rate = 0.75
        audioPlayer?.play()
    }
    
    @IBAction func rabbitButton(sender: UIButton) {
        audioPlayer?.rate = 1.25
        audioPlayer?.play()
    }
    @IBAction func chipmunkButton(sender: UIButton) {
        playAudioWithVariablePitch(750)
    }
    
    @IBAction func darthButton(sender: UIButton) {
        playAudioWithVariablePitch(-750)
    }
    
    
    func playAudioWithVariablePitch(pitch: Float) {
        
        audioEngine = AVAudioEngine()
        audioRatePitch = AVAudioUnitTimePitch()
        audioPlayerNode = AVAudioPlayerNode()

        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        
        try! audioEngine.start()
        
        audioPlayerNode.play()
        
    }

    
    @IBAction func stopClip(sender: UIButton) {
        audioPlayer?.stop()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
