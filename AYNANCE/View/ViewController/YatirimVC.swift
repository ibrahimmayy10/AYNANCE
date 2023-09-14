//
//  YatirimVC.swift
//  AYNANCE
//
//  Created by İbrahim Ay on 11.08.2023.
//

import UIKit
import CoreData

class YatirimVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var yatirimTableView: UITableView!
    @IBOutlet weak var bakiyeLabel: UILabel!
    
    var selectedItem: CoinsModel?
    
    var tutar: Double?
    var bakiye = 10000000.0
    
    var coinList: CoinsModel?
    
    var nameArray = [String]()
    var idArray = [UUID]()
    var tutarArray = [Double]()
    
    var selectedName = ""
    var selectedNameID = UUID()
    var selectedTutar = Double()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        yatirimTableView.dataSource = self
        yatirimTableView.delegate = self
        
        let kalanBakiye = bakiye - (tutar ?? 0)
        bakiyeLabel.text = String(kalanBakiye)
        
        getData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: "newData"), object: nil)
    }
    
    @objc func getData () {
        
        nameArray.removeAll(keepingCapacity: false)
        tutarArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Coins")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let name = result.value(forKey: "name") as? String,
                       let tutar = result.value(forKey: "tutar") as? Double,
                       let id = result.value(forKey: "id") as? UUID {
                        nameArray.append(name)
                        tutarArray.append(tutar)
                        idArray.append(id)
                    }
                }
            }
        } catch {
            print("error")
        }
    }

    @IBAction func gecButton(_ sender: Any) {
        performSegue(withIdentifier: "toPiyasaVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = yatirimTableView.dequeueReusableCell(withIdentifier: "yatirimTableViewCell", for: indexPath) as! YatirimTableViewCell
        cell.yatirimNameLabel.text = nameArray[indexPath.row]
        cell.tutarNameLabel.text = String(format: "%.2f", tutarArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedName = nameArray[indexPath.row]
        selectedTutar = tutarArray[indexPath.row]
        selectedNameID = idArray[indexPath.row]
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "toDetailsVC") as! DetailsVC
        detailsVC.chosenName = selectedName
        detailsVC.chosenNameID = selectedNameID
        detailsVC.chosenTutar = selectedTutar
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}
