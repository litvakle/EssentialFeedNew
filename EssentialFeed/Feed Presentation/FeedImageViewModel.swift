//
//  Copyright © 2019 Essential Developer. All rights reserved.
//

public struct FeedImageViewModel<Image> {
	public let description: String?
	public let location: String?
	public let image: Image?
	public let isLoading: Bool
	public let shouldRetry: Bool
	
	public var hasLocation: Bool {
		return location != nil
	}
    
    public init(description: String?, location: String?, image: Image?, isLoading: Bool, shouldRetry: Bool) {
        self.description = description
        self.location = location
        self.image = image
        self.isLoading = isLoading
        self.shouldRetry = shouldRetry
    }
}
