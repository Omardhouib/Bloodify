//
//  TipsViewController.swift
//  Bloodify
//
//  Created by Omar Dhouib on 11/11/18.
//  Copyright © 2018 Omar Dhouib. All rights reserved.
//

import UIKit

class TipsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        tabBarItem = UITabBarItem(title: "", image: UIImage(named: "3708111-32"), tag: 3)
    }
    
    @IBOutlet weak var walkThroughCollectionView:UICollectionView!
    var imgArr = [  "Conseil:1",
                    "Conseil:2",
                    "Conseil:3",
                    "Conseil:4",
                    "Conseil:5",
                    "Conseil:6",
                    "Conseil:7"]
    var imgArr2 = [" Tout antécédent d'injection de produits stupéfiants par voie intraveineuse, même remontant à plusieurs années, constitue une contre-indication permanente au don de sang.",
                       "Vous devez peser plus de 50 kg car ce poids minimum garantit votre sécurité.",
                       "Par mesure de précaution, le don de sang n’est pas possible actuellement si vous avez reçu une transfusion sanguine ou une greffe. Attention, il ne faut pas confondre transfusion et perfusion",
                       "Pour éviter tout risque de carence, vous ne pouvez pas donner si vous êtes enceinte. Et vous devez attendre 6 mois après l’accouchement.",
                       "Si vous souffrez d’anémie, vous devez attendre que votre taux d’hémoglobine revienne à la normale pour donner votre sang.",
                       "Le don de sang est possible un jour après un détartrage ou le traitement d’une carie et une semaine après une extraction dentaire.",
                       "Vous ne pouvez pas donner si vous avez eu une relation sexuelle, même protégée, avec plus d’un partenaire au cours des 4 derniers mois. Cette contre-indication ne s’applique pas aux femmes ayant eu des relations sexuelles uniquement avec des femmes."
]
    
    var imgArr3 = [  UIImage(named:"a4"),
                     UIImage(named:"a3") ,
                     UIImage(named:"a7") ,
                     UIImage(named:"a5") ,
                     UIImage(named:"a1") ,
                     UIImage(named:"a44") ,
                     UIImage(named:"a6")
                    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        walkThroughCollectionView.register(UINib.init(nibName: "WalkThroughCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "walkThroughIdentifierß")
        
        let floawLayout = UPCarouselFlowLayout()
        floawLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height: walkThroughCollectionView.frame.size.height)
        floawLayout.scrollDirection = .horizontal
        floawLayout.sideItemScale = 0.8
        floawLayout.sideItemAlpha = 1.0
        floawLayout.spacingMode = .fixed(spacing: 5.0)
        walkThroughCollectionView.collectionViewLayout = floawLayout
        
        walkThroughCollectionView.delegate = self
        walkThroughCollectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = walkThroughCollectionView.dequeueReusableCell(withReuseIdentifier: "walkThroughIdentifierß", for: indexPath) as! WalkThroughCollectionViewCell
        
        cell.lblSubtitle.text = imgArr2[indexPath.row]
        cell.lblTitle.text = imgArr[indexPath.row]
        cell.imgvWalkthrough.image = imgArr3[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("itm selected == \(indexPath.row)")
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.walkThroughCollectionView.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
    
    fileprivate var currentPage: Int = 0 {
        didSet {
            print("page at centre = \(currentPage)")
        }
    }
    
    fileprivate var pageSize: CGSize {
        let layout = self.walkThroughCollectionView.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
