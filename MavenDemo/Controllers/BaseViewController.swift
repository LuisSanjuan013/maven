//
//  BaseViewController.swift
//  MavenDemo
//
//  Created by Luis Angel Sanjuan Palafox on 8/15/21.
//

import UIKit
class BaseViewController: UIViewController {

    var visibleMuteButton = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let volume = UIBarButtonItem(image: UIImage(named: Constants.kVolume), style: .plain, target: self, action: #selector(openVolumeControl))
        self.parent?.navigationItem.setRightBarButton(volume, animated: true)
    }
    
    @objc func openVolumeControl() {
        let storyboard = UIStoryboard(name: Constants.kMain, bundle: nil)
        let volumeControl : VolumeControlViewController = storyboard.instantiateViewController(withIdentifier: "VolumeControlViewController") as! VolumeControlViewController
        volumeControl.showMuteButton = visibleMuteButton
        self.navigationController?.pushViewController(volumeControl, animated: true)
    }
    
    //MARK: -
    
    func setTitle(title: String) {
        self.parent?.title = title
    }
    
    func setVisibleMuteButton(isVisible: Bool) {
        visibleMuteButton = isVisible
    }

}
