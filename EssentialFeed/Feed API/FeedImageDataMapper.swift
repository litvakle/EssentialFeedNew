//
//  FeedImageDataMapper.swift
//  EssentialFeed
//
//  Created by Lev Litvak on 30.08.2022.
//  Copyright © 2022 Essential Developer. All rights reserved.
//

import Foundation

public final class FeedImageDataMapper {
    public enum Error: Swift.Error {
        case invalidData
    }
    
    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> Data {
        guard response.isOK, !data.isEmpty else {
            throw Error.invalidData
        }
        
        return data
    }
}
