//
// DefinedMessage.swift
// HandsOff
// https://www.github.com/twostraws/HandsOff
// See LICENSE for license information.
//

import AppIntents

/// All the pre-defined messages we let users show in their widgets.
enum DefinedMessage: String, AppEnum {
    static let caseDisplayRepresentations: [DefinedMessage: DisplayRepresentation] = [
        .custom: "Custom (Enter below)",
        .beIntentional: "Be intentional.",
        .breakTheLoop: "Break the loop.",
        .choosePresence: "Choose presence.",
        .doLiterallyAnythingElse: "Do literally anything else.",
        .drinkSomeWater: "Drink some water.",
        .enjoyTheQuiet: "Enjoy the quiet.",
        .handsOff: "Hands off!",
        .iDontThinkSo: "I don't think so.",
        .justPause: "Just pause.",
        .niceTry: "Nice try.",
        .no: "No.",
        .noNewNotifications: "No new notifications.",
        .nope: "Nope.",
        .oneThingAtATime: "One thing at a time.",
        .putDownYourPhone: "Put down your phone.",
        .putItDownYouSuperstar: "Put it down, you superstar.",
        .putYourPhoneAway: "Put your phone away.",
        .reallyAgain: "Really? Again?",
        .reclaimYourTime: "Reclaim your time.",
        .sameAppsSameScroll: "Same apps, same scroll.",
        .stillHere: "Still here?",
        .stopScrolling: "Stop scrolling.",
        .stretchInstead: "Stretch instead.",
        .thatsEnoughPixelsForToday: "That’s enough pixels for today.",
        .theVoidSaysHello: "The void says hello.",
        .theresNothingNewHere: "There’s nothing new here.",
        .theresStillTimeToStop: "There’s still time to stop.",
        .thisCanWait: "This can wait.",
        .thisIsntRest: "This isn’t rest.",
        .thisWillStillBeHereLater: "This will still be here later.",
        .timeToLogOff: "Time to log off.",
        .walkAway: "Walk away.",
        .wasThisIntentional: "Was this intentional?",
        .whatAreYouAvoiding: "What are you avoiding?",
        .whatWereYouAboutToDo: "What were you about to do?",
        .whyAreYouOnYourPhone: "Why are you on your phone?",
        .writeThatIdeaDown: "Write that idea down.",
        .youDontNeedToReplyRightNow: "You don’t need to reply right now.",
        .youJustOpenedThisOutOfReflex: "You just opened this out of reflex.",
        .youPromised: "You promised.",
        .youWereDoingSoWell: "You were doing so well.",
        .youreAlreadyEnough: "You’re already enough.",
        .youreDoingItAgain: "You’re doing it again.",
        .youreNotMissingAnything: "You’re not missing anything",
        .youveGotBetterThingsToDo: "You’ve got better things to do."
    ]

    case custom
    case beIntentional
    case breakTheLoop
    case choosePresence
    case doLiterallyAnythingElse
    case drinkSomeWater
    case enjoyTheQuiet
    case handsOff
    case iDontThinkSo
    case justPause
    case niceTry
    case no // swiftlint:disable:this identifier_name
    case noNewNotifications
    case nope
    case oneThingAtATime
    case putDownYourPhone
    case putItDownYouSuperstar
    case putYourPhoneAway
    case reallyAgain
    case reclaimYourTime
    case sameAppsSameScroll
    case stillHere
    case stopScrolling
    case stretchInstead
    case thatsEnoughPixelsForToday
    case theVoidSaysHello
    case theresNothingNewHere
    case theresStillTimeToStop
    case thisCanWait
    case thisIsntRest
    case thisWillStillBeHereLater
    case timeToLogOff
    case walkAway
    case wasThisIntentional
    case whatAreYouAvoiding
    case whatWereYouAboutToDo
    case whyAreYouOnYourPhone
    case writeThatIdeaDown
    case youDontNeedToReplyRightNow
    case youJustOpenedThisOutOfReflex
    case youPromised
    case youWereDoingSoWell
    case youreAlreadyEnough
    case youreDoingItAgain
    case youreNotMissingAnything
    case youveGotBetterThingsToDo

    static let typeDisplayRepresentation: TypeDisplayRepresentation = "Message"
}
