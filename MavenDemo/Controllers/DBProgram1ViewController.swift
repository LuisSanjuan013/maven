//
//  DBProgram1ViewController.swift
//  MavenDemo
//
//  Created by Luis Angel Sanjuan Palafox on 8/15/21.
//

import UIKit

class DBProgram1ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTitle(title: "Program 1")
        setVisibleMuteButton(isVisible: false)
    }

}
