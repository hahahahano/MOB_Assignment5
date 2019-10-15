//
//  AnimalTableViewController.swift
//  group18_assignment5
//
//  Created by Group 18 on 10/13/19.
//  Copyright © 2019 Group 18. All rights reserved.
//

import UIKit

class AnimalTableViewController: UITableViewController {
    //MARK: Properties
    var animals = [Animal]()
    var chosenAnimal = ""
    let animalCollectionViewController = AnimalCollectionViewController()
    
    //MARK: Private Methods
    private func loadAnimals() {
        let photo1 = UIImage(named:"arcticFox")
        let photo2 = UIImage(named:"beluga")
        let photo3 = UIImage(named:"narwhal")
        let photo4 = UIImage(named:"humpbackWhale")
        let photo5 = UIImage(named:"polarBear")
        let photo6 = UIImage(named:"ringedSeal")
        
        guard let animal1 = Animal(name:"Arctic Fox", photo: photo1, sciName:"Vulpes lagopus", aniClass:"Mammalia", size:"7.05 lbs") else {
            fatalError("Unable to instantiate animal")
        }
        guard let animal2 = Animal(name:"Polar Bear", photo: photo5, sciName:"Ursus maritimus", aniClass:"Mammalia", size:"715 lbs") else {
            fatalError("Unable to instantiate animal")
        }
        guard let animal3 = Animal(name: "Ringed Seal", photo: photo6, sciName:"Pusa hispida", aniClass:"Mammalia", size:"160 lbs") else {
            fatalError("Unable to instantiate animal")
        }
        guard let animal4 = Animal(name: "Humpback Whale", photo: photo4, sciName:"Megaptera novaeangliae", aniClass:"Mammalia", size:"66,000 lbs") else {
            fatalError("Unable to instantiate animal")
        }
        guard let animal5 = Animal(name: "Beluga Whale", photo: photo2, sciName:"Delphinapterus leucas", aniClass:"Mammalia", size:"3,000 lbs") else {
            fatalError("Unable to instantiate animal")
        }
        guard let animal6 = Animal(name: "Narwhal", photo: photo3, sciName:"Monodon monoceros", aniClass:"Mammalia", size:"2,100 lbs") else {
            fatalError("Unable to instantiate animal")
        }
        
        animals += [animal1, animal2, animal3, animal4, animal5, animal6]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load animals
        loadAnimals()
    }

    //MARK: Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (animals.count*2)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Cell Identifiers
        let aniCellIdentifier = "aniCell"
        let detailCellIdentifier = "detailCell"
        
        guard let aniCell = tableView.dequeueReusableCell(withIdentifier: aniCellIdentifier, for: indexPath) as? AnimalTableViewCell  else {
            fatalError("The dequeued cell is not an instance of AnimalTableViewCell.")
        }
        guard let detailCell = tableView.dequeueReusableCell(withIdentifier: detailCellIdentifier, for: indexPath) as? AnimalTableViewCell  else {
            fatalError("The dequeued cell is not an instance of AnimalTableViewCell.")
        }
        
        //Fetches appropriate animal
        let animal = animals[(indexPath.row/2)]
        
        aniCell.aniName.text = animal.name
        aniCell.aniPhoto.image = animal.photo
        detailCell.aniSciName.text = animal.sciName
        detailCell.aniClass.text = animal.aniClass
        detailCell.aniWeight.text = animal.size
        
        if (indexPath.row.isMultiple(of: 2)) {
            return aniCell
        } else {
            return detailCell
        }
    }
    
    /*
    //@Author Christian
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenAnimal = animals[indexPath.row/2].name
        //performSegue(withIdentifier: "animalSegue", sender: self)
            //animalCollectionViewController.chosenAnimal = chosenAnimal    //navigationController?.pushViewController(animalCollectionViewController, animated: true)
        print(chosenAnimal)
        print("HALLOOOOOO")
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "animalSegue"{
            
            let vc = segue.destination as! AnimalCollectionViewController
            
            if let selectedCell = segue.destination as? AnimalTableViewCell {
                
                let indexPath = tableView.indexPath(for: selectedCell)!
                let name = animals[indexPath.row]
            }
            
            vc.chosenAnimal = self.chosenAnimal
        }
        
    }
    
    
}
