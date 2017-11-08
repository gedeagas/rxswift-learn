//
//  StarwarsListTableViewController.swift
//  swift-fetch-data
//
//  Created by Agastya Darma on 08/11/17.
//  Copyright © 2017 Agastya Darma. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class StarwarsListTableViewController: UITableViewController {

    let iniCell = "starwars_cell"
    
    let apiClient = StarWarsApiClient()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        populateTableViewWithStarWarsData()
    }
    
    
    private func populateTableViewWithStarWarsData() {
        self.tableView.delegate = nil
        self.tableView.dataSource = nil
        self.apiClient
            .fetchAllPeople()
            .map({ data -> [PeopleResponse] in
                guard let peoples = data?.peoples else {
                    return []
                }
                
                return peoples
                
            })
            .bind(to: self.tableView.rx.items) {remotetv, idx, data in
                let cell = remotetv.dequeueReusableCell(withIdentifier: self.iniCell)!
                
                
                cell.textLabel?.text = data.name
                
                return cell
                
            }
            .disposed(by: disposeBag)
    }


   

}
