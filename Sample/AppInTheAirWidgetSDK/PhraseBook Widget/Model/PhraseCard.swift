//
// Created by Makar Stetsenko on 31/10/15.
// Copyright (c) 2015 App in the Air. All rights reserved.
//

import Foundation
import AVFoundation

class PhraseCard {
    var script:String = ""
    var engTranslation:String = ""
    var native:String = ""
    var cardDescription:String = ""
    var soundFilename:String = ""
    var timeFilter:String = ""

    class func loadCardsForCountry(countryCode: String, filter: Bool) -> [PhraseCard]? {
        var cardModels = [PhraseCard]()
        
        let path = NSBundle.mainBundle().pathForResource("PhraseBookData", ofType: "plist")
        let data = NSDictionary(contentsOfFile: path!)
        
        if let cards = data![countryCode] as! [Dictionary<String, String>]? {
            for cardData in cards {
                let card = PhraseCard()
                
                card.script = cardData["script"]!
                card.engTranslation = cardData["eng"]!
                card.native = cardData["native"]!
                card.cardDescription = cardData["cardDescription"]!
                card.soundFilename = cardData["sound"]!
                card.timeFilter = cardData["time"]!
                
                if self.isRightTime(card) || !filter {
                    cardModels.append(card)
                }

            }
        } else { return nil }
        
        return cardModels
    }

    class func isRightTime(card: PhraseCard) -> Bool {
        let now = NSDate()
        let cal = NSCalendar.currentCalendar()
        let comps = cal.components(.Hour, fromDate: now)
        let hour = comps.hour

        print(hour)

        var currentTimeOfDay = ""
        switch hour {
        case 0 ... 12:
            currentTimeOfDay = "morning"
        case 13 ... 17:
            currentTimeOfDay = "noon"
        default:
            currentTimeOfDay = "evening"
        }

        if card.timeFilter == currentTimeOfDay || card.timeFilter == "any" {
            return true
        } else { return false }
    }

    var audioPlayer : AVAudioPlayer! = nil
    func playSound() {
        let soundURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(self.soundFilename, ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL:soundURL)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            print("Played")
        } catch {
            print("Error getting the audio file")
        }
    }
}
