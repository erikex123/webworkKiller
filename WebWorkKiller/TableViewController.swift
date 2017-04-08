//
//  TableViewController.swift
//  WebWorkKiller
//
//  Created by エリック on 2017/04/07.
//  Copyright © 2017年 エリック. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    

    @IBOutlet var hitableView: UITableView!
    
    

    
    var mathFucntionsArray = [mathFunctionsEnum]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      hitableView.delegate = self
      hitableView.dataSource = self
      mathFucntionsArray = [.definiteIntegral, .improperIntegral]


    }



    // MARK: - Table view data source



   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  self.mathFucntionsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MathFucntions

        cell.configCell(mathFucntionsArray[indexPath.row])
        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFunc = mathFucntionsArray[indexPath.row]
        switch selectedFunc {
        case .definiteIntegral:
            performSegue(withIdentifier: "definiteIntegralSegue", sender: self)
        case .improperIntegral:
            performSegue(withIdentifier: "improperIntegralSegue", sender: self)
            
         default: print("default")
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
 

}
