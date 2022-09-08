//
//  ImageCommentsEndPoint.swift
//  EssentialFeed
//
//  Created by Lev Litvak on 05.09.2022.
//  Copyright © 2022 Essential Developer. All rights reserved.
//

import Foundation

public enum ImageCommentsEndPoint {
    case get(UUID)
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case let .get(id):
            return baseURL.appendingPathComponent("v1/image/\(id)/comments")
        }
    }
}
