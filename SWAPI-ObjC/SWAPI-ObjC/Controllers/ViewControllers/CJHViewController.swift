//
//  CJHViewController.swift
//  SWAPI-ObjC
//
//  Created by Connor Holland on 6/25/20.
//  Copyright © 2020 Connor Holland. All rights reserved.
//

import UIKit

class CJHViewController: UIViewController {

    @IBOutlet weak var personSearchBar: UISearchBar!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personSearchBar.delegate = self
    }
    
    func updateViews(person: CJHPerson) {
        DispatchQueue.main.async {
            self.nameLabel.text = person.name
            self.heightLabel.text = "Height: \(person.height)"
        }
    }
}

extension CJHViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchTerm = personSearchBar.text, !searchTerm.isEmpty else {return}
        CJHPersonController.fetchPerson(withSearchTerm: searchTerm) { (person) in
            self.updateViews(person: person)
        }
    }
}
