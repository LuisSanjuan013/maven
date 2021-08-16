//
//  VolumeControlViewController.swift
//  MavenDemo
//
//  Created by Luis Angel Sanjuan Palafox on 8/15/21.
//

import UIKit
import MediaPlayer
import AVFoundation

class VolumeControlViewController: UIViewController {

    @IBOutlet weak var muteButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    private var outputVolumeObserve: NSKeyValueObservation?
    private let audioSession = AVAudioSession.sharedInstance()
    var showMuteButton = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.kVolume
        listenVolumeButton()
        if !showMuteButton{
            hideMuteButton()
        }
    }

    //MARK: - IBActions
    
    @IBAction func muteVolume(_ sender: Any) {
        //Update system volume
        MPVolumeView.setVolume(0)
        DispatchQueue.main.async {
            self.volumeSlider.value = 0
        }
    }
    @IBAction func volumeControl(_ sender: Any) {
        MPVolumeView.setVolume(volumeSlider.value)
    }
    
    //MARK: - Helper Methods

    func listenVolumeButton() {
        do {
            try audioSession.setActive(true)
        } catch let error{
            print(error)
        }
        outputVolumeObserve = audioSession.observe(\.outputVolume) { (audioSession, changes) in
            DispatchQueue.main.async {
                self.volumeSlider.value = audioSession.outputVolume
            }
        }
    }
    
    func hideMuteButton()  {
        muteButton.removeFromSuperview()
    }
}

//MARK: - Update system volume

extension MPVolumeView {
    static func setVolume(_ volume: Float) {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            slider?.value = volume
        }
    }
}
