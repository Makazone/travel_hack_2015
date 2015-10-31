//
//  PhraseBookWidgetCell.swift
//  AppInTheAirWidgetSDK
//
//  Created by Sergey Pronin on 10/23/15.
//  Copyright © 2015 App in the Air. All rights reserved.
//

import UIKit
import WidgetSDK

protocol PhraseCellWidgetDelegate {
    func showAllCards()
}

class ChecklistWidgetCell: WidgetCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    var countryCode:String = ""
    var cards:[PhraseCard] = []
    var delegate:PhraseCellWidgetDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.registerNib(UINib(nibName: "PhraseBookItemCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "PhraseCell")

        self.collectionView.dataSource = self
        self.collectionView.delegate = self

    }
    
    func loadCards() {
        let cards = PhraseCard.loadCardsForCountry(self.countryCode, filter: true)
        if cards != nil {
            self.cards = cards!
        }
        self.collectionView.reloadData()
    }

    @IBAction func showAllCards(sender: AnyObject) {
        if let delegate = self.delegate {
            delegate.showAllCards()
        }
    }
}

extension ChecklistWidgetCell: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: PhraseCardCell = collectionView.dequeueReusableCellWithReuseIdentifier("PhraseCell", forIndexPath: indexPath) as! PhraseCardCell
        let card = self.cards[indexPath.row]
        
        cell.engTranslation.text  = card.engTranslation
        cell.cardDescription.text = card.cardDescription
        cell.nativeWord.text      = card.native
        cell.script.text          = card.script

        cell.indexPath = indexPath
        cell.delegate = self
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
}

extension ChecklistWidgetCell : UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        return self.collectionView.frame.size;
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return UIEdgeInsetsZero
    }
}

extension ChecklistWidgetCell: PhraseCellDelegate {
    func longPressToPlay(cell: PhraseCardCell) {
        if let path = cell.indexPath {
            let card = self.cards[path.row]
            card.playSound()
        }
    }
}




