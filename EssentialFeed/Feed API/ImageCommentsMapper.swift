//
//  ImageCommentsMapper.swift
//  EssentialFeed
//
//  Created by Lev Litvak on 30.08.2022.
//  Copyright © 2022 Essential Developer. All rights reserved.
//

import Foundation

final class ImageCommentsMapper {
    private struct Root: Decodable {
        let items: [RemoteFeedItem]
    }
    
    static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RemoteFeedItem] {
        guard response.isOK, let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw RemoteImageCommentsLoader.Error.invalidData
        }

        return root.items
    }
}