//
//  Beer.swift
//  Alcohol
//
//  Created by 임재현 on 2023/08/26.
//

import Foundation

struct Beer: Decodable {
    let id: Int?
    let name, taglineString, description, brewersTips, imageURL: String?
    let foodParing: [String]?
    
    var tagLine: String {
        let tags = taglineString?.components(separatedBy: ". ")
        let hashtags = tags?.map { "#" + $0.replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: ".", with: "")
            .replacingOccurrences(of: ",", with: " #")
        }
        return hashtags?.joined(separator: " ") ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, description
        case taglineString = "tagline"
        case imageURL = "image_url"
        case brewersTips = "brewers_tips"
        case foodParing = "food_pairing"
    }
}

