/*
 This source file is part of the Swift.org open source project
 
 Copyright (c) 2014 - 2021 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception
 
 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
*/

import XCTest

import PlayingCard
import DeckOfPlayingCards

class DeckTests: XCTestCase {
    func testStandard52CardDeck() {
        var countByPlayingCard: [PlayingCard: Int] = [:]

        var deck = Deck.standard52CardDeck()
        while let playingCard = deck.deal() {
            countByPlayingCard[playingCard, default: 0] += 1
        }

        XCTAssertEqual(countByPlayingCard.count, 52)
        XCTAssertTrue(countByPlayingCard.values.allSatisfy { $0 == 1 })

        for rank in Rank.allCases {
            for suit in Suit.allCases {
                let playingCard = PlayingCard(rank: rank, suit: suit)
                XCTAssertEqual(countByPlayingCard[playingCard], 1)
            }
        }
    }
    
    func testDeal() {
        let playingCard = PlayingCard(rank: .ace, suit: .clubs)
        var deck: Deck = [playingCard]
        
        XCTAssertEqual(deck.deal(), playingCard)
        XCTAssertNil(deck.deal())
    }
    
    func testCountEmptyDeckHasZeroCards() {
        let deck = Deck()
        XCTAssertEqual(deck.count, 0)
    }
    
    func testCountStandard52CardDeckHas52Cards() {
        let deck = Deck.standard52CardDeck()
        
        XCTAssertEqual(deck.count, 52)
    }
    
    func testCountDealingDecreasesCountByOne() {
        var deck = Deck([PlayingCard(rank: .ace, suit: .spades), PlayingCard(rank: .queen, suit: .hearts)])
        
        XCTAssertEqual(deck.count, 2)
        XCTAssertNotNil(deck.deal())
        XCTAssertEqual(deck.count, 1)
    }
}
