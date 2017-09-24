//
//  ViewController.swift
//  DocTalk
//
//  Created by saikrishna on 22/09/17.
//  Copyright © 2017 apnacomplex. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UINavigationControllerDelegate {
    var items:[String]=["sai","rakesh","sasi","krishna","saikrishna","sampath"]
    var filitems:[String]=[]
    @IBOutlet weak var Searchbar: UISearchBar!
      @IBOutlet weak var tabview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Searchbar.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filitems=items.filter({(x) in
            return x.contains(searchText.lowercased())
        })
        self.tabview.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "customcell",for: indexPath)as!CustCell
        if(Searchbar.text != ""){
            cell.Label.text=filitems[indexPath.row]
        }
        else{
            cell.Label.text=items[indexPath.row]
        }
     
        cell.selectionStyle = .none
        cell.separatorInset=UIEdgeInsets.zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(Searchbar.text != ""){
           return filitems.count
        }
        else{
           return items.count
        }
    }
   
}

