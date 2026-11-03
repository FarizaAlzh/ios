//
//  ViewController.swift
//  Music Player
//
//  Created by Фариза on 30.10.2026.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    private var currentIndex = 0
    private var isPlaying = false
    private var player : AVAudioPlayer?
    
    @IBAction func prevTapped(_ sender: Any) {
        print("Previous нажата")
    }
    
    @IBAction func playPauseTapped(_ sender: Any) {
        guard let player = player else { return }
        
        if isPlaying {
            player.pause()
        }
        else {
            player.play()
        }
        
        isPlaying.toggle()
        updateUI()
        
        print("playPauseTapped нажата")
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        print("nextTapped нажата")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTrack(at : currentIndex)
        updateUI()
    }
    
    private func loadTrack(at index : Int){
        let track = TrackLibrary.tracks[index]
        
        guard let url = Bundle.main.url(forResource: track.fileName, withExtension: "mp3")
        else { print("File not Found:  \(track.fileName).mp3")
            return }
        
        do {
            player = try AVAudioPlayer(contentsOf : url)
            player?.prepareToPlay()
        } catch {
            print("Error loading audio: \(error)")
        }
    }
    
    private func updateUI(){
        let track = TrackLibrary.tracks[currentIndex]
        
        titleLabel.text = track.title
        artistLabel.text = track.artist
        coverImageView.image = UIImage(named: track.coverImageName)
        
        let iconName = isPlaying ? "pause.fill" : "play.fill"
        playPauseButton.setImage(UIImage(systemName: iconName), for: .normal)
    }
   
    
}
