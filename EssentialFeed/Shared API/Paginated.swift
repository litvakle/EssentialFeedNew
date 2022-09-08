//
//  Paginated.swift
//  EssentialFeed
//
//  Created by Lev Litvak on 08.09.2022.
//  Copyright © 2022 Essential Developer. All rights reserved.
//

public struct Paginated<Item> {
    public typealias LoadMoreCompletion = (Result<Self, Error>) -> Void
    
    public let items: [Item]
    public let loadMore: ((@escaping LoadMoreCompletion) -> Void)?
    
    public init(items: [Item], loadMore: ((@escaping LoadMoreCompletion) -> Void)? = nil) {
        self.items = items
        self.loadMore = loadMore
    }
}
