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
    
    class func loadCardsForCountry(countryCode: String) -> [PhraseCard]? {
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
                
                cardModels.append(card)
            }
        } else { return nil }
        
        return cardModels
    }

    func playSound() {
        let soundURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(self.soundFilename, ofType: "mp3")!)
        do {
            let audioPlayer = try AVAudioPlayer(contentsOfURL:soundURL)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch {
            print("Error getting the audio file")
        }
    }
}
