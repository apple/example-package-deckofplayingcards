/*
 This source file is part of the Swift.org open source project

 Copyright 2015 - 2016 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

import FisherYates
import PlayingCard

/// A model for shuffling and dealing a deck of playing cards.
///
/// The  playing card deck consists of 52 individual cards in four suites: spades, hearts, diamonds, and clubs. There are 13 ranks from two to ten, then jack, queen, king, and ace.
public struct Deck {
    fileprivate var cards: [PlayingCard]

    /// Returns a deck of playing cards.
    public static func standard52CardDeck() -> Deck {
        let suits: [Suit] = [.spades, .hearts, .diamonds, .clubs]
        let ranks: [Rank] = [.two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king, .ace]

        var cards: [PlayingCard] = []
        for rank in ranks {
            for suit in suits {
                cards.append(PlayingCard(rank: rank, suit: suit))
            }
        }

        return Deck(cards)
    }

    /// Creates a deck of playing cards.
    public init(_ cards: [PlayingCard]) {
        self.cards = cards
    }

    /// Randomly shuffles a deck of playing cards.
    public mutating func shuffle() {
        cards.shuffle()
    }

    /// Deals a card from the deck.
    ///
    /// The function returns the last card in the deck.
    public mutating func deal() -> PlayingCard? {
        guard !cards.isEmpty else { return nil }

        return cards.removeLast()
    }
}

// MARK: - ExpressibleByArrayLiteral

extension Deck : ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: PlayingCard...) {
        self.init(elements)
    }
}

// MARK: - Equatable

extension Deck : Equatable {}

/// Compares two decks of card for equality.
///
/// - Parameters:
///     - lhs: The left-hand side `Deck` object to compare.
///     - rhs: The right-hand side `Deck` object to compare.
///
/// - Returns: A Boolean value of `true` if the two `Deck` objects are equal; otherwise, `false`.
public func ==(lhs: Deck, rhs: Deck) -> Bool {
    return lhs.cards == rhs.cards
}

/// Compares two decks of card for inequality.
///
/// - Parameters:
///     - lhs: The left-hand side `Deck` object to compare.
///     - rhs: The right-hand side `Deck` object to compare.
///
/// - Returns: A Boolean value of `true` if the two `Deck` objects are not equal; otherwise, `false`.
public func !=(lhs: Deck, rhs: Deck) -> Bool {
    return lhs.cards != rhs.cards
}
