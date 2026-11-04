# Music Player

A simple single-screen iOS music player built with Swift and Storyboard.
The screen shows the track cover, title, artist, and Previous / Play-Pause / Next controls. Tracks are played from audio files bundled with the app.

## Screenshots

### iPhone 16 Pro Max
<img width="281" height="587" alt="iPhone 16 Pro Max" src="https://github.com/user-attachments/assets/60b47b7a-f7be-4fcb-99b9-21cf48cbdb7b" />

### iPhone SE (3rd generation)
<img width="306" height="607" alt="iPhone SE" src="https://github.com/user-attachments/assets/f935c7f5-0809-4386-8ff3-b64f3618c002" />

### Demo
https://github.com/user-attachments/assets/8e391a75-1a3b-4d30-b718-9096954fb62f

## Features

- Track cover, title, and artist
- Previous, Play/Pause, and Next controls
- Play/Pause icon switches between `play.fill` and `pause.fill`
- Wrap-around navigation: Next on the last track goes to the first, Previous on the first goes to the last
- Automatic transition to the next track when the current one finishes
- Playback state (playing or paused) is kept when switching tracks

## Tech Stack

- Xcode
- Swift
- UIKit
- Storyboard
- Auto Layout (UIStackView)
- AVFoundation (AVAudioPlayer)

## Layout

The whole layout is built in `Main.storyboard` using nested UIStackViews:
- a vertical root stack view pinned to the Safe Area with 20 pt margins
- a vertical stack view with the title and artist labels
- a horizontal stack view with the three control buttons

## Track Library

Tracks are defined in `TrackLibrary.swift` as an array of `Track` structs with `title`, `artist`, `fileName`, and `coverImageName`. Audio files are stored in the `songs` folder and added to the app target, so they end up in the bundle.


## How to Run

1. Open `Music Player.xcodeproj` in Xcode
2. Select iPhone SE (3rd generation) or iPhone 16 Pro Max as the simulator
3. Press **Run** to build and launch the app

## Author

Fariza, Module 8 Assignment: UIStackView & Auto Layout
