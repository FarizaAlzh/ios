# BeautyShop

A simple multi-screen iOS catalog of cosmetic products built with Swift and Storyboard.
The app has three screens: a list of product categories, a list of products inside the selected category, and a detail screen with full information about one product. Navigation is handled by a `UINavigationController`.

## Screenshots

### Categories
<img width="280" alt="Categories" src="https://github.com/user-attachments/assets/ca594615-5d8c-492c-aeea-0fef431555e0" />

### Products
<img width="280" alt="Products" src="https://github.com/user-attachments/assets/340f3179-6007-4e37-a8de-25bb72df9930" />

### Detail
<img width="280" alt="Detail" src="https://github.com/user-attachments/assets/1a1c5be5-0641-4d38-b07a-821b7963275b" />

### Launch Screen
<img width="280" alt="Launch Screen" src="https://github.com/user-attachments/assets/9e95109e-0b87-4eee-a0f8-1e2919202ef8" />

### App Icon on Home Screen
<img width="280" alt="App Icon" src="https://github.com/user-attachments/assets/9f9065ca-2301-4f7d-babc-bf5e23fe2493" />

### Demo
[https://github.com/user-attachments/assets/18ba08ce-5a9c-4479-99d5-4f171513eb04]

## Features

- Large "Каталог" title in the first screen's navigation bar, collapsing on scroll
- Three-level navigation: Categories → Products → Product Detail
- Scrollable lists using `UITableView` with custom cells
- Product cells show only the image and the title, as required
- Detail screen shows the large image, title, subtitle, 5-star rating, price in tenge, and full description
- Rating shown with SF Symbols: `star.fill` for the rating, `star` for the rest
- Price formatted for the Russian locale with the tenge sign (for example, 8 097 ₸)
- Back button and edge swipe return to the previous screen
- The selected row is deselected after returning to the list
- Cells are reused while scrolling through `dequeueReusableCell(withIdentifier:for:)`
- Custom app icon and Launch Screen with the app logo

## Tech Stack

- Xcode
- Swift
- UIKit
- Storyboard
- Auto Layout (UIStackView)
- UINavigationController with large titles
- UITableView, UITableViewDataSource, UITableViewDelegate
- Storyboard segues (Show) with `prepare(for:sender:)`
- SF Symbols

## Layout

The whole layout is built in `Main.storyboard`:
- **Catalog scene:** a navigation controller with a table view of category cells. Each cell has an image and a title, with a disclosure indicator.
- **Products scene:** a table view of product cells. Each cell has an image and a title.
- **Detail scene:** a vertical stack view with a large product image, title, subtitle, a horizontal stack of five star image views, price, and description.

Segues:
- `showProducts`: from the category cell to the products screen
- `showDetail`: from the product cell to the detail screen

Each view controller is responsible only for its own screen. `ViewController` shows categories, `ProductsViewController` shows products of one category, and `DetailViewController` fills its own fields from the product it receives.

## Data

The project uses two structs in `Product.swift`:
- `Product`: `title`, `subtitle`, `imageName`, `rating`, `description`, `price`
- `Category`: `name`, `imageName`, `products`

The data is stored in one array, `categories`, in `Data.swift`. It contains [КОЛИЧЕСТВО_КАТЕГОРИЙ] categories and [КОЛИЧЕСТВО_ТОВАРОВ] products. Each image is added to `Assets.xcassets` under the name in `imageName`.

## How to Run

1. Open `BeautyShop.xcodeproj` in Xcode
2. Select iPhone 16 Pro Max (or another iPhone) as the simulator
3. Press **Run** to build and launch the app

## Author

Fariza, Lab 10 Assignment: UINavigationController & Detail Screen
