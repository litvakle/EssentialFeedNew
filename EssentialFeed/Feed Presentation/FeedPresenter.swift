//
//  Copyright © 2019 Essential Developer. All rights reserved.
//

import Foundation

public protocol FeedView {
	func display(_ viewModel: FeedViewModel)
}

public final class FeedPresenter {
	public static var title: String {
		return NSLocalizedString("FEED_VIEW_TITLE",
			tableName: "Feed",
			bundle: Bundle(for: FeedPresenter.self),
			comment: "Title for the feed view")
	}
	
    public static func map(_ feed: [FeedImage]) -> FeedViewModel {
        return FeedViewModel(feed: feed)
    }
}
