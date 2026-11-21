//
//  Product.swift
//  BeautyList
//
//  Created by Фариза on 07.11.2026.
//

struct Product {
    let title: String
    let subtitle: String
    let imageName: String
    let rating: Int
    let description: String
    let price: Int
}

struct Category {
    let name: String
    let imageName: String
    let products: [Product]
}

