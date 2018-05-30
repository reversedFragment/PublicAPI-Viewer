//
//  API List Model.swift
//  PublicAPI Viewer
//
//  Created by Ben Adams on 5/30/18.
//  Copyright © 2018 Ben Adams. All rights reserved.
//

import Foundation

struct TopLevelData: Codable {
    let entries: [openAPI]
}

struct openAPI: Codable {
    let api: String
    let description: String
    let auth: Auth
    let https: Bool
    let cors: Cors
    let link: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case api = "API"
        case description = "Description"
        case auth = "Auth"
        case https = "HTTPS"
        case cors = "Cors"
        case link = "Link"
        case category = "Category"
    }
}

enum Auth: String, Codable {
    case apiKey = "apiKey"
    case empty = ""
    case oAuth = "OAuth"
    case xMashapeKey = "X-Mashape-Key"
}

enum Cors: String, Codable {
    case no = "no"
    case unknown = "unknown"
    case yes = "yes"
}
