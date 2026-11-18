# Wishlist

A simple single-screen iOS wishlist built with Swift and Storyboard.
The screen shows a list of 20 favorite cosmetic products in a `UITableView`. Each row has a product photo, name, description, a 5-star rating, and price in tenge.

## Screenshots

### iPhone 16 Pro Max
<img width="280" height="569" alt="iPhone 16 Pro Max" src="https://github.com/user-attachments/assets/2d2e610f-13d1-420a-8bc2-c348ff2264ae" />


### iPhone SE (3rd generation)
<img width="294" height="606" alt="iPhone SE" src="https://github.com/user-attachments/assets/8c0c1244-0b46-4f5f-9bde-d3419d231054" />

### Demo
https://github.com/user-attachments/assets/b50d7c78-ccc5-4f5e-8986-4dae100b72b7



## Features

- Large "Wishlist" title in a navigation bar that collapses on scroll
- Scrollable list of 20 products using `UITableView`
- Custom cell with product image, title, description, price, and rating
- Rating shown as 5 star icons (`star.fill` for the rating, `star` for the rest)
- Price formatted for the Russian locale with the tenge sign (for example, 8 097 ₸)
- Cells are reused while scrolling through `dequeueReusableCell(withIdentifier:for:)`

## Tech Stack

- Xcode
- Swift
- UIKit
- Storyboard
- Auto Layout (UIStackView)
- UITableView and UITableViewDataSource
- UINavigationController with large title
- SF Symbols

## Layout

The whole layout is built in `Main.storyboard`:
- a table view pinned to the Safe Area on all four sides
- a prototype cell with class `FavoriteCell` and reuse identifier `FavoriteCell`
- a horizontal root stack view inside the cell's content view, pinned with equal margins
- a fixed-size image view on the left
- a vertical stack view on the right with the title, subtitle, and a bottom row
- a bottom row with five star image views and the price label, separated by a flexible spacer view

The cell class `FavoriteCell` contains only `@IBOutlet` connections and a `configure(with:)` method. It has no layout code.

## Data

Products are described by the `FavoriteItem` struct in `FavoriteItem.swift`, with `title`, `subtitle`, `imageName`, `rating`, and `price` fields.

The 20 items are stored in one array, `favoriteItems`, in `FavoriteData.swift`. Each product image is added to `Assets.xcassets` under the name in `imageName`.

## How to Run

1. Open `BeautyList.xcodeproj` in Xcode
2. Select iPhone SE (3rd generation) or iPhone 16 Pro Max as the simulator
3. Press **Run** to build and launch the app

## Author

Fariza, Lab 9 Assignment: UITableView & Custom Cells<img width="283" height="588" alt="Снимок экрана 2026-11-18 в 18 06 43" src="https://github.com/user-attachments/assets/c067c5e0-dd25-49ab-978c-3f3bb3e774e1" />
