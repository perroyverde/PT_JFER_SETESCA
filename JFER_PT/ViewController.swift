//
//  ViewController.swift
//  JFER_PT
//
//  Created by Jose Ferre on 3/7/17.
//  Copyright © 2017 JFER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var family: [Person] = []
    var sons: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSettings()
        mockFamily()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func mockFamily() {
        
        let father = Person.init(name: "Longinos", age: 30, rol: .father)
        family.append(father)
        let mother = Person.init(name: "Gervasia", age: 28, rol: .mother)
        family.append(mother)
        let porfirio = Person.init(name: "Porfirio", age: 2, rol: .son)
        family.append(porfirio)
        let adelfa = Person.init(name: "Adelfa", age: 1, rol: .son)
        family.append(adelfa)
        let castulo = Person.init(name: "Cástulo", age: 3, rol: .son)
        family.append(castulo)
        
        family.forEach { person in dump(person.description) }
        
        sons = family.filter({ person -> Bool in return person.rol == .son })
        
        sons.sort { $0.age < $1.age }
        sons.forEach { person in dump(person.description) }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    fileprivate func initSettings() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0: return family.count
        case 1: return sons.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "personPreviewCell")!
        
        let person = (indexPath.section == 0) ? family[indexPath.row] : sons[indexPath.row]
        cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        cell.textLabel?.text = person.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Familia"
        case 1: return "Hijos - ASC"
        default: return nil
        }
    }
}

