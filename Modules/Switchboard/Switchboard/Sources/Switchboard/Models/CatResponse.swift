//
//  MovieResponse.swift
//  Switchboard
//
//  Created by Bodgar Espinosa Miranda on 16/01/25.
//

import Foundation
import UIKit

/// Model to receive the detail of the cats from the response.
public struct CatResponse: Decodable {
    
    public let id: String
    public let mimetype: String
    public let size: Int
    public let tags: [String]
    
    /// Initializes a new instance of `ImageItem`.
    ///
    /// - Parameters:
    ///   - id: The unique identifier for the item.
    ///   - mimetype: The MIME type of the file (e.g., "image/jpeg").
    ///   - size: The size of the file in bytes.
    ///   - tags: A list of tags associated with the item.
    public init(
        id: String,
        mimetype: String,
        size: Int,
        tags: [String]
    ) {
        self.id = id
        self.mimetype = mimetype
        self.size = size
        self.tags = tags
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case mimetype
        case size
        case tags
    }
}
