//
//  ViewController.swift
//  RecordAudio
//
//  Created by jonathan tang on 10/23/15.
//  Copyright © 2015 jonathan tang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        stopButton.hidden = true;
        recordButton.enabled = true;
    }
    @IBAction func recordAudio(sender: UIButton) {
        recordingLabel.hidden = false;
        stopButton.hidden = false;
        recordButton.enabled = false;
    }
    @IBAction func stopRecording(sender: UIButton) {
        recordingLabel.hidden = true;
        recordButton.enabled = true;
        stopButton.hidden = true;
    }


}

