//
//  ViewController.swift
//  ProfileLab
//
//  Created by Фариза on 24.10.2026.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var avatarLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }
    
    private func fillData() {
        avatarLabel.text = "AF"
    }


}

