//
//  PhraseBookWidgetCell.swift
//  AppInTheAirWidgetSDK
//
//  Created by Sergey Pronin on 10/23/15.
//  Copyright © 2015 App in the Air. All rights reserved.
//

import UIKit
import WidgetSDK

class ChecklistWidgetCell: WidgetCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    var countryCode:String = ""
    var cards:[PhraseCard] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.registerNib(UINib(nibName: "PhraseBookItemCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "PhraseCell")

        self.collectionView.dataSource = self
        self.collectionView.delegate = self

    }
    
    func loadCards() {
        let cards = PhraseCard.loadCardsForCountry(self.countryCode)
        if cards != nil {
            self.cards = cards!
        }
        self.collectionView.reloadData()
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





