//
//  AnimalCollectionViewController.swift
//  group18_assignment5
//
//  Created by Group 18 on 10/13/19.
//  Copyright © 2019 Group 18. All rights reserved.
//

import UIKit

class AnimalCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    //MARK: Properties
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let reuseIdentifier = "galleryCell"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    var gallery = [AnimalGallery]()
    var chosenAnimal = ""
    //var temp = AnimalCollectionViewController()
    var captions = [String]()
    var images = [UIImage]()
    
    private func loadGallery(){
        accessPList()
        
        //chosenAnimal = temp.chosenAnimal
        print(chosenAnimal)
        switch chosenAnimal {
        case "Arctic Fox":
            let img = [UIImage(named:"arcticFox1"),UIImage(named:"arcticFox2"),UIImage(named:"arcticFox3")]
            for index in 0...2 {
                gallery.append(AnimalGallery(caption: captions[index], photo: img[index])!)
            }
        case "Polar Bear":
            let img = [UIImage(named:"polarBear1"),UIImage(named:"polarBear2"),UIImage(named:"polarBear3")]
            for index in 0...2 {
                gallery.append(AnimalGallery(caption: captions[index], photo: img[index])!)
            }
        case "Ringed Seal":
            let img = [UIImage(named:"ringedSeal1"),UIImage(named:"ringedSeal2"),UIImage(named:"ringedSeal3")]
            for index in 0...2 {
                gallery.append(AnimalGallery(caption: captions[index], photo: img[index])!)
            }
        case "Humpback Whale":
            let img = [UIImage(named:"humpbackWhale1"),UIImage(named:"humpbackWhale2"),UIImage(named:"humpbackWhale3")]
            for index in 0...2 {
                gallery.append(AnimalGallery(caption: captions[index], photo: img[index])!)
            }
        case "Beluga Whale":
            let img = [UIImage(named:"belugaWhale1"),UIImage(named:"belugaWhale2"),UIImage(named:"belugaWhale3")]
            for index in 0...2 {
                gallery.append(AnimalGallery(caption: captions[index], photo: img[index])!)
            }
        case "Narwhal":
            let img = [UIImage(named:"narwhal1"),UIImage(named:"narwhal2"),UIImage(named:"narwhal3")]
            for index in 0...2 {
                gallery.append(AnimalGallery(caption: captions[index], photo: img[index])!)
            }
        default:
            print("this")
        }
    }
    
    func accessPList(){
        let inputFile = Bundle.main.path(forResource: "Gallery", ofType: "plist")
        let inputDataArray = NSArray(contentsOfFile: inputFile!)
        for input in inputDataArray as! [NSDictionary] {
            for value in input.allKeys {
                captions.append(value as! String)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        loadGallery()
    }

    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let galleryCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? AnimalCollectionViewCell else {
            fatalError("The dequeued cell is not an instance of AnimalTableViewCell.")
        }
    
        let galleryInput = gallery[(indexPath.row)]
        galleryCell.aniGalleryCaption.text = galleryInput.caption
        galleryCell.aniGalleryPhoto.image = galleryInput.photo

        return galleryCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath)
        let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath)

        //headerView.headerLabel.text =
        //footerView.footerLabel.text =
        
        return headerView
      }
}
