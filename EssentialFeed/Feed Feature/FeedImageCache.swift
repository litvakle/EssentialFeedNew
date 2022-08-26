//
//  FeedImageCache.swift
//  EssentialFeed
//
//  Created by Lev Litvak on 26.08.2022.
//  Copyright © 2022 Essential Developer. All rights reserved.
//

import Foundation

public protocol FeedImageDataCache {
    typealias Result = Swift.Result<Void, Error>

    func save(_ data: Data, for url: URL, completion: @escaping (Result) -> Void)
}
