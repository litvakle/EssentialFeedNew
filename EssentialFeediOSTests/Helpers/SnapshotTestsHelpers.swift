//
//  SnapshotTestsHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Lev Litvak on 02.09.2022.
//  Copyright © 2022 Essential Developer. All rights reserved.
//

import Foundation
import XCTest

func assert(snapshot: UIImage, named name: String, file: StaticString = #file, line: UInt = #line) {
    let snapshotURL = makeSnapshotURL(named: name, file: file)
    let snapshotData = makeSnapshotData(for: snapshot, file: file, line: line)
    
    guard let storedSnapshotData = try? Data(contentsOf: snapshotURL) else {
        XCTFail("Failed to load stored snapshot at URL: \(snapshotURL). Use the `record` method to store a snapshot before asserting.", file: file, line: line)
        return
    }
    
    if snapshotData != storedSnapshotData {
        let temporarySnapshotURL = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
            .appendingPathComponent(snapshotURL.lastPathComponent)
        
        try? snapshotData?.write(to: temporarySnapshotURL)
        
        XCTFail("New snapshot does not match stored snapshot. New snapshot URL: \(temporarySnapshotURL), Stored snapshot URL: \(snapshotURL)", file: file, line: line)
    }
}

func record(snapshot: UIImage, named name: String, file: StaticString = #file, line: UInt = #line) {
    let snapshotURL = makeSnapshotURL(named: name, file: file)
    let snapshotData = makeSnapshotData(for: snapshot, file: file, line: line)
    
    do {
        try FileManager.default.createDirectory(
            at: snapshotURL.deletingLastPathComponent(),
            withIntermediateDirectories: true
        )
        
        try snapshotData?.write(to: snapshotURL)
    } catch {
        XCTFail("Failed to record snapshot with error: \(error)", file: file, line: line)
    }
}

private func makeSnapshotURL(named name: String, file: StaticString) -> URL {
    return URL(fileURLWithPath: String(describing: file))
        .deletingLastPathComponent()
        .appendingPathComponent("snapshots")
        .appendingPathComponent("\(name).png")
}

private func makeSnapshotData(for snapshot: UIImage, file: StaticString, line: UInt) -> Data? {
    guard let data = snapshot.pngData() else {
        XCTFail("Failed to generate PNG data representation from snapshot", file: file, line: line)
        return nil
    }
    
    return data
}

private final class SnapshotWindow: UIWindow {
    private var configuration: SnapshotConfiguration = .iPhone8(style: .light)
    
    convenience init(configuration: SnapshotConfiguration, root: UIViewController) {
        self.init(frame: CGRect(origin: .zero, size: configuration.size))
        self.configuration = configuration
        self.layoutMargins = configuration.layoutMargins
        self.rootViewController = root
        self.isHidden = false
        root.view.layoutMargins = configuration.layoutMargins
    }
    
    override var safeAreaInsets: UIEdgeInsets {
        return configuration.safeAreaInsets
    }
    
    override var traitCollection: UITraitCollection {
        return UITraitCollection(traitsFrom: [super.traitCollection, configuration.traitCollection])
    }
    
    func snapshot() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds, format: .init(for: traitCollection))
        return renderer.image { action in
            layer.render(in: action.cgContext)
        }
    }
}

extension UIViewController {
    func snapshot(for configuration: SnapshotConfiguration) -> UIImage {
        return SnapshotWindow(configuration: configuration, root: self).snapshot()
    }
}
