//
//  ImageComment.swift
//  EssentialFeed
//
//  Created by Lev Litvak on 30.08.2022.
//  Copyright © 2022 Essential Developer. All rights reserved.
//

import Foundation

public struct ImageComment: Equatable {
    public let id: UUID
    public let message: String
    public let createdAt: Date
    public let username: String
    
    public init(id: UUID, message: String, createdAt: Date, username: String) {
        self.id = id
        self.message = message
        self.createdAt = createdAt
        self.username = username
    }
}
