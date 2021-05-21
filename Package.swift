// swift-tools-version:5.3

/*
 This source file is part of the Swift.org open source project

 Copyright 2015 – 2021 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

import PackageDescription

let package = Package(
    name: "DeckOfPlayingCards",
    products: [
        .library(name: "DeckOfPlayingCards", targets: ["DeckOfPlayingCards"]),
    ],
    dependencies: [
        .package(name: "PlayingCard",
                 url: "https://github.com/apple/example-package-playingcard.git",
                 from: "3.0.0"),
    ],
    targets: [
        .target(
            name: "DeckOfPlayingCards",
            dependencies: [
                .byName(name: "PlayingCard")
            ]),
        .testTarget(
            name: "DeckOfPlayingCardsTests",
            dependencies: [
                .target(name: "DeckOfPlayingCards")
            ]),
    ]
)
