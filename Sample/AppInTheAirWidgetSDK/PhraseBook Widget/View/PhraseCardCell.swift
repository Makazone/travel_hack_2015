//
// Created by Makar Stetsenko on 31/10/15.
// Copyright (c) 2015 App in the Air. All rights reserved.
//

import Foundation
import UIKit



class PhraseCardCell: UICollectionViewCell {

    @IBOutlet weak var cardDescription: UILabel!
    @IBOutlet weak var nativeWord: UILabel!
    @IBOutlet weak var script: UILabel!
    @IBOutlet weak var engTranslation: UILabel!

    @IBAction func playCard(sender: AnyObject) {
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        let pressToPlay = UILongPressGestureRecognizer(target: self, action:Selector("playCard"))
        self.contentView.addGestureRecognizer(pressToPlay)
        self.contentView.userInteractionEnabled = true
    }

    func playCard() {
    }

}
