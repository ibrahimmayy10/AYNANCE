//
//  CoinBuyVC.swift
//  AYNANCE
//
//  Created by İbrahim Ay on 9.08.2023.
//

import UIKit

class CoinBuyVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var coinList = [CoinsModel]()
    var filteredCoinList = [CoinsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        getDataCoins()
                
    }
    
    func getDataCoins() {
        let url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"

        guard let url = URL(string: url) else { return }
        Webservices().downloadCoins(url: url) { result in
            switch result {
            case .success(let coins):
                self.coinList = coins
                self.filteredCoinList = coins
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCoinList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        let item = filteredCoinList[indexPath.row]
        cell.item = item
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 107
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = filteredCoinList[indexPath.row]
        if let detailsVC = storyboard?.instantiateViewController(identifier: "toDetailsVC") as? DetailsVC {
            detailsVC.selectedItem = selectedItem
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }

}

extension CoinBuyVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchString = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if searchString.isEmpty {
            filteredCoinList = coinList
        } else {
            filteredCoinList = coinList.filter({ coins in
                return coins.name.localizedCaseInsensitiveContains(searchString) || coins.symbol.localizedCaseInsensitiveContains(searchString)
            })
        }
        tableView.reloadData()
    }
}
