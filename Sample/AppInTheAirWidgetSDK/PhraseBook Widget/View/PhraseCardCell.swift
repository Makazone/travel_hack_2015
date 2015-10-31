//
// Created by Makar Stetsenko on 31/10/15.
// Copyright (c) 2015 App in the Air. All rights reserved.
//

import Foundation
import UIKit

protocol PhraseCellDelegate {
    func longPressToPlay(cell: PhraseCardCell)
}

class PhraseCardCell: UICollectionViewCell {

    @IBOutlet weak var cardDescription: UILabel!
    @IBOutlet weak var nativeWord: UILabel!
    @IBOutlet weak var script: UILabel!
    @IBOutlet weak var engTranslation: UILabel!

    var indexPath: NSIndexPath?
    var delegate:PhraseCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        let pressToPlay = UITapGestureRecognizer(target: self, action:Selector("playCard"))
        self.contentView.addGestureRecognizer(pressToPlay)
        self.contentView.userInteractionEnabled = true
    }

    func playCard() {
       if let delegate = self.delegate {
           delegate.longPressToPlay(self)
       }
    }

}
