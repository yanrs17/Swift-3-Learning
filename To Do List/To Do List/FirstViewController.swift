//
//  FirstViewController.swift
//  To Do List
//
//  Created by Ryan Ruoshui Yan on 06/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var items: [String] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        var items: [String] = []
        items = (UserDefaults.standard.object(forKey: "items") as? [String])!
        print(UserDefaults.standard.object(forKey: "items")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            items.remove(at: indexPath.row)
            
            tableView.reloadData()
            
            UserDefaults.standard.set(items, forKey: "items")
            
            print(UserDefaults.standard.object(forKey: "items")!)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewDidLoad() // Important!! .reloadData() only does not work
        tableView.reloadData()
        print(UserDefaults.standard.object(forKey: "items")!)
    }


}

