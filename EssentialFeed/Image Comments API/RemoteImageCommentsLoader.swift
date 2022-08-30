//
//  RemoteImageCommentsLoader.swift
//  EssentialFeed
//
//  Created by Lev Litvak on 30.08.2022.
//  Copyright © 2022 Essential Developer. All rights reserved.
//

import Foundation

public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>

public extension RemoteImageCommentsLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: ImageCommentsMapper.map)
    }
}
