//
//  ListPersonView.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Anderson F Carvalho on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class ListPersonView: UIView {
    
    let cellName = "Cell"
    var listPerson: ListPerson?
    var filterPeople: ListPerson?
    var viewController: ListPersonViewControllerPortocol?
    
    let searchBar: UISearchBar = {
       let search = UISearchBar()
        
        return search
    }()
    
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
        
        searchBar.delegate = self
        
        self.addSubview(searchBar)
        self.addSubview(tableView)
        
        if #available(iOS 11.0, *) {
            searchBar.anchor(top: self.safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, size: CGSize(width: 0, height: 50))
        } else {
            searchBar.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, size: CGSize(width: 0, height: 50))
        }
        
        tableView.anchor(top: searchBar.bottomAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor)
        
        tableView.reloadData()
    }
}

extension ListPersonView: ListPersonViewProtocol {
    func showPeople(_ people: ListPerson?) {
        
        DispatchQueue.main.async {
        
            if let listPeople = people?.people, self.listPerson != nil {
                self.listPerson?.people?.append(contentsOf: listPeople)
                self.listPerson?.next = people?.next
            }else {
                self.listPerson = people
            }
            
            self.filterPeople = self.listPerson
            
            self.tableView.reloadData()
        }
    
    }
    
    
}

extension ListPersonView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterPeople?.people?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellName) else {
            return UITableViewCell()
        }
        
        let person = filterPeople?.people?[indexPath.row]
        
        cell.textLabel?.text = person?.name
        
        if listPerson?.next != nil, indexPath.row == (listPerson?.people?.count ?? 1) - 1 {
            viewController?.getNewPage(listPerson?.next)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        viewController?.openPeople(filterPeople?.people?[indexPath.row])
    }
    
}

extension ListPersonView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            self.filterPeople = self.listPerson
        }else {
            
            self.filterPeople?.people = self.listPerson?.people?.filter({ (item) -> Bool in
                return item.name?.lowercased().contains(searchText.lowercased()) == true
            })
        }
        self.tableView.reloadData()
    }
}
