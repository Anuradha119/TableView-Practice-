//
//  ActorsTableViewController.swift
//  TableView(Practice)
//
//  Created by Marni Anuradha on 1/8/20.
//  Copyright © 2020 Marni Anuradha. All rights reserved.
//

import UIKit

class ActorsTableViewController: UITableViewController {

    var tollywoodActors = ["Tarak", "Mahesh Babu", "Prabhas", "Allu Arjun", "Nani", "Sumanth", "Ram", "Rana", "Sushanth", "Kalyan Ram"]
    
    var bollywoodActors = ["Salman Khan", "Sharukh Khan", "Aamir Khan", "Ajay Devgan", "Ranveer Singh", "Ranbir Kapoor", "Shahid Kapoor", "Saif Ali Khan", "Amitabh Bachan", "Akshay Kumar"]
    
    var hollywoodActors = ["Tom Cruise", "Tom Hank", "Will Smith", "Matt Damon", "Hugh Jackman", "Chris Evans", "Jackie Chan", "Johnny Depp", "Leonardo DiCaprio", "Dwayne Johnson"]
    
    var searchControl:UISearchController!
    //var actors = ["tollywoodActors", "bollywoodActors", "hollywoodActors"]
    var actorsTV:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       createUI()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        actorsTV.register(UITableViewCell.self, forCellReuseIdentifier: "abc")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func createUI()
    {
        actorsTV = UITableView(frame: view.frame, style: UITableView.Style.grouped)
        actorsTV.delegate = self
        actorsTV.dataSource = self
        view.addSubview(actorsTV)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows.
        return tollywoodActors.count
        if(section == 0)
        {
            return tollywoodActors.count
        }
        else if(section == 1)
        {
            return bollywoodActors.count
        }
        else
        {
            return hollywoodActors.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath)

        // Configure the cell...
        if(indexPath.section == 0)
        {
            cell.textLabel!.text = tollywoodActors[indexPath.row]
            //cell.detailTextLabel!.text = "Actor"
        }
        else if(indexPath.section == 1)
        {
            cell.textLabel!.text = bollywoodActors[indexPath.row]
            //cell.detailTextLabel!.text = "Actor"
        }
        else
        {
            cell.textLabel!.text = hollywoodActors[indexPath.row]
            //cell.detailTextLabel!.text = "Actor"
        }
        
        //cell.imageView!.image = UIImage(named: "icon")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if(section == 0)
        {
            return "Tollywood"
        }
        else if(section == 1)
        {
            return "Bollywood"
        }
        else{
            return "Hollywood"
        }
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {

        if(section == 0)
        {
            return ""
        }
        else if(section == 1)
        {
            return ""
        }
        else{
            return ""
        }
    }
    
   /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        
        if(indexPath.row%2 == 0)
        {
            return true
        }
        else
        {
            return false
        }
    }
    */
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        if(indexPath.row%2 == 0)
        {
            return UITableViewCell.EditingStyle.insert
        }
        else
        {
            return UITableViewCell.EditingStyle.delete
        }
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .insert {
            
            print("Insert rows")
            tollywoodActors.insert("Venkatesh", at: indexPath.row)
            //bollywoodActors.insert("Varun Dhawan", at: indexPath.row)
            //hollywoodActors.insert("Arnald", at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.middle)
            
        } else if editingStyle == .delete {
            
            print("Delete rows")
            tollywoodActors.remove(at: indexPath.row)
           // bollywoodActors.remove(at: indexPath.row)
          //  hollywoodActors.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)

        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

        var storedName = tollywoodActors[fromIndexPath.row]
        
        tollywoodActors.remove(at: fromIndexPath.row)
        //bollywoodActors.remove(at: fromIndexPath.row)
        //hollywoodActors.remove(at: fromIndexPath.row)

        tollywoodActors.insert(storedName, at: to.row)
        //bollywoodActors.insert(storedName, at: to.row)
        //hollywoodActors.insert(storedName, at: to.row)
        print("User dragged from \(fromIndexPath.row) and dropped at \(to.row)")
        print(tollywoodActors)
        //print(bollywoodActors)
        //print(hollywoodActors)
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
