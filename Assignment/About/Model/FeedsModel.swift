//
//  FeedsModel.swift
//  Assignment
//
//  Created by Ravi Patel on 07/10/20.
//  Copyright © 2020 Ravi Patel. All rights reserved.
//

import Foundation

// MARK: - AboutCanada
struct AboutCanada: Codable {
    let title: String
    let rows: [About]
}

// MARK: - About
struct About: Codable {
    let title, rowDescription: String?
    let imageHref: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }
}
