//
//  ChecklistWidgetCell.swift
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

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.registerNib(UINib(nibName: "PhraseBookItemCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "PhraseCell")

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

}

extension ChecklistWidgetCell: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PhraseCell", forIndexPath: indexPath)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
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





