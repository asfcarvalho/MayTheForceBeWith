//
//  ListPersonView.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Proaire on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class ListPersonView: UIView {
    
    let cellName = "Cell"
    var listPerson: ListPerson?
    var viewController: ListPersonViewControllerPortocol?
    
    let tableView: UITableView = {
       let table = UITableView()
        table.separatorStyle = .none
        table.bounces = false
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configView() {
        
        self.backgroundColor = UIColor.white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellName)
        tableView.delegate = self
        tableView.dataSource = self
        
        self.addSubview(tableView)
        
        tableView.fillSuperview()
        
        tableView.reloadData()
    }
}

extension ListPersonView: ListPersonViewProtocol {
    func showPeople(_ people: ListPerson?) {
        
        if let listPeople = people?.people, self.listPerson != nil {
            self.listPerson?.people?.append(contentsOf: listPeople)
            self.listPerson?.next = people?.next
        }else {
            self.listPerson = people
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    
}

extension ListPersonView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPerson?.people?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellName) else {
            return UITableViewCell()
        }
        
        let person = listPerson?.people?[indexPath.row]
        
        cell.textLabel?.text = person?.name
        
        if listPerson?.next != nil, indexPath.row == (listPerson?.people?.count ?? 1) - 1 {
            viewController?.getNewPage(listPerson?.next)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        viewController?.openPeople(listPerson?.people?[indexPath.row])
    }
    
}
