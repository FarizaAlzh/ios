import Foundation

struct Track {
    let title : String
    let artist : String
    let fileName : String
    let coverImageName : String
}

enum TrackLibrary {
    static let tracks: [Track] = [
        Track(title: "Training Season", artist: "Dua Lipa", fileName: "1", coverImageName: "1"),
        Track(title: "Настоящая", artist: "Ваня Дмитриенко", fileName: "2", coverImageName: "2"),
        Track(title: "Shape Of My Heart", artist: "Sting", fileName: "3", coverImageName: "3"),
        Track(title: "Боже, Какой Пустяк", artist: "Александр Иванов", fileName: "4", coverImageName: "4"),
        Track(title: "Save Your Tears", artist: "The Weeknd", fileName: "5", coverImageName: "5"),
        Track(title: "Павлодар", artist: "Серик Мусалимов", fileName: "6", coverImageName: "6"),
        Track(title: "Rise And Fall", artist: "Craig David & Sting", fileName: "7", coverImageName: "7"),
        Track(title: "I Wanna Love You", artist: "Akon feat.Snoop Dogg", fileName: "8", coverImageName: "8"),
        Track(title: "Billie Jean", artist: "Michael Jackson", fileName: "9", coverImageName: "9"),
        Track(title: "Show Me Love", artist: "WizTheMc feat.Bees & Honey", fileName: "10", coverImageName: "10")
    ]
}

