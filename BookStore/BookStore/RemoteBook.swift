//
//  RemoteBook.swift
//  BookStore
//
//  Created by 박준영 on 5/3/24.
//

import Foundation

struct RemoteBook: Decodable {
    let title: String
    let authors: String
    let thumbnail: URL
    let price: Int32
    let contents: String
}
