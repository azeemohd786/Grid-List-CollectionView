//
//  ViewController.swift
//  Grid&ListCollectionView
//
//  Created by Mohammed Azeem Azeez on 04/03/2019.
//  Copyright © 2019 Riverswave Technologies Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet var listButton: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var gridbutton: UIButton!
    var isGridFlowLayoutUsed: Bool = false {
        didSet {
            updateButtonAppearance()
        }
    }
    
    var gridFlowLayout = GridFlowLayout()
    var listFlowLayout = ListFlowLayout()
    fileprivate let Array = ["River Cruise", "North Island", "Mountain trail", "Southern Coast", "Fishing Place", "Green Themeland", "Sunset Park"]
    fileprivate let itemsToDisplay = [("1", "River cruise"), ("2", "North Island"), ("3", "Mountain trail"), ("4", "Southern Coast"), ("5", "Fishing place"), ("6", "Green Themeland"), ("7", "Sunset Park")] // image names
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.collectionViewLayout = gridFlowLayout
        collectionView.dataSource = self
        isGridFlowLayoutUsed = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gridButtonDidTap(_ sender: UIButton) {
        isGridFlowLayoutUsed = true
    }
    
    @IBAction func listButtonDidTap(_ sender: UIButton) {
        isGridFlowLayoutUsed = false
        
    }
    
    fileprivate func updateButtonAppearance() {
        //        gridButton.isSelected = isGridFlowLayoutUsed
        //        gridButton.backgroundColor = gridButton.isSelected ? UIColor.groupTableViewBackground : UIColor.green
        //
        //        listButton.isSelected = !isGridFlowLayoutUsed
        //        listButton.backgroundColor = listButton.isSelected ? UIColor.groupTableViewBackground : UIColor.green
        
        let layout = isGridFlowLayoutUsed ? gridFlowLayout : listFlowLayout
        UIView.animate(withDuration: 0.2) { () -> Void in
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.setCollectionViewLayout(layout, animated: true)
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsToDisplay.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: globalCell.self), for: indexPath) as! globalCell
        
        let index = indexPath.row % itemsToDisplay.count
        let imageName = itemsToDisplay[index].0
        cell.imageView.image = UIImage(named: imageName)
        cell.label.text = Array[indexPath.row]
      cell.cardView.setCardView(view: cell.cardView)
      
        return cell
        
    }
}
extension UIView {
    
    func setCardView(view : UIView){
        
        view.layer.cornerRadius = 2.0
        view.layer.borderColor  =  UIColor.lightGray.cgColor
        view.layer.borderWidth = 2.0
        view.layer.shadowOpacity = 1.0
        view.layer.shadowColor =  UIColor.clear.cgColor
        view.layer.shadowRadius = 2.0
        view.layer.shadowOffset = CGSize(width:3, height: 3)
        view.layer.masksToBounds = true
        
    }
}




