//
//  ViewController.swift
//  Music Player
//
//  Created by Фариза on 30.10.2026.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
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
        let count = TrackLibrary.tracks.count
        currentIndex = (currentIndex - 1 + count) % count
        changeTrack()
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
        goToNextTrack()
    }
    
    private func goToNextTrack(){
        currentIndex = (currentIndex + 1) % TrackLibrary.tracks.count
        changeTrack()
    }
    
    private func changeTrack(){
        let wasPlaying = isPlaying
        loadTrack(at: currentIndex)
        
        if wasPlaying, let player = player{
            player.play()
            isPlaying = true
        } else { isPlaying = false }
        
        updateUI()
            
    }
    
    func audioPlayerDidFinishPlaying(_ player : AVAudioPlayer, successfully flag: Bool){
        goToNextTrack()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTrack(at : currentIndex)
        updateUI()
    }
    
    private func loadTrack(at index : Int){
        player = nil
        let track = TrackLibrary.tracks[index]
        
        guard let url = Bundle.main.url(forResource: track.fileName, withExtension: "mp3")
        else { print("File not Found:  \(track.fileName).mp3")
            return }
        
        do {
            player = try AVAudioPlayer(contentsOf : url)
            player?.delegate = self
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
