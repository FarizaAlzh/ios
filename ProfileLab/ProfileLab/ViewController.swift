//
//  ViewController.swift
//  ProfileLab
//
//  Created by Фариза on 24.10.2026.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var avatarLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var postsCountLabel: UILabel!
    @IBOutlet weak var postsTitleLabel: UILabel!
    
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var followersTitleLabel: UILabel!
    
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followingTitleLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }
    
    private func fillData() {
        avatarLabel.text = "AF"
        nameLabel.text = "Alzhan Fariza"
        subtitleLabel.text = "iOS Developer · Almaty"
        
        postsCountLabel.text = "1"
        postsTitleLabel.text = "Posts"
        followersCountLabel.text = "132"
        followersTitleLabel.text = "Followers"
        followingCountLabel.text = "162"
        followingTitleLabel.text = "Following"
    }


}

