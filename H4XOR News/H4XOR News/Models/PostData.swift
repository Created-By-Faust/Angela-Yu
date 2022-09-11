//
//  PostData.swift
//  H4XOR News
//
//  Created by Дмитрий Емелин on 06.09.2022.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
    
}

struct Post: Decodable, Identifiable {
    
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
