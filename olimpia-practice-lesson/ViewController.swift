//
//  ViewController.swift
//  olimpia-practice-lesson
//
//  Created by Levi Davis on 11/7/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit
import MGSwipeTableCell

class ViewController: UIViewController {
    
    var objects = [LibraryWrapper]()
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(LibraryTableViewCell.self, forCellReuseIdentifier: "thisCell")
        return tableView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        constrainTableView()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
        // Do any additional setup after loading the view.
    }
    
    private func loadData() {
        objects = LibraryWrapper.getLibraries(from: GetLocation.getData(name: "BklynLibraryInfo", type: "json"))
    }
    

    private func constrainTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        [tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)].forEach{$0.isActive = true}
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "thisCell", for: indexPath) as! LibraryTableViewCell
        let oneObject = objects[indexPath.row]
        cell.textLabel?.text = oneObject.title
        
        cell.leftButtons = [MGSwipeButton(title: "Add to List", icon: .add, backgroundColor: .lightGray, callback: { (cell) -> Bool in
            print("An action has to be added here.")
            return true
        })]
        
        cell.leftSwipeSettings.transition = .rotate3D
        
        cell.rightButtons = [MGSwipeButton(title: "Delete", icon: .remove, backgroundColor: .lightGray, callback: { (cell) -> Bool in
            print("BALETED!")
            self.objects.remove(at: indexPath.row)
            let indexPath = IndexPath(item: indexPath.row, section: 0)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            return true
        })]
        
        cell.rightSwipeSettings.transition = .rotate3D
        
//        cell.layer.cornerRadius = 25
//        cell.backgroundColor = .cyan
//        cell.clipsToBounds = true
//        cell.layoutIfNeeded()
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

