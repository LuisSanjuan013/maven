//
//  ViewController.swift
//  MavenDemo
//
//  Created by Luis Angel Sanjuan Palafox on 8/15/21.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var deviceAButton: UIButton!
    @IBOutlet weak var deviceBButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
//MARK: Helper Methods
    func setupButtons() {
        deviceAButton.layer.borderWidth = 1
        deviceAButton.layer.borderColor = #colorLiteral(red: 0.1051317826, green: 0.533177197, blue: 0.9983835816, alpha: 1)
        deviceAButton.layer.cornerRadius = 5
        
        deviceBButton.layer.borderWidth = 1
        deviceBButton.layer.borderColor = #colorLiteral(red: 0.1051317826, green: 0.533177197, blue: 0.9983835816, alpha: 1)
        deviceBButton.layer.cornerRadius = 5
    }

//MARK: IBActions
    @IBAction func openDeviceA(_ sender: Any) {
        let storyboard = UIStoryboard(name: Constants.kMain, bundle: nil)
        let daprogramVC = storyboard.instantiateViewController(withIdentifier: "DeviceATabBarController")
        self.navigationController?.pushViewController(daprogramVC, animated: true)
    }
    
    @IBAction func openDeviceB(_ sender: Any) {
        let storyboard = UIStoryboard(name: Constants.kMain, bundle: nil)
        let dbprogramVC = storyboard.instantiateViewController(withIdentifier: "DeviceBTabBarController")
        self.navigationController?.pushViewController(dbprogramVC, animated: true)
    }
}

