//
//  BuildingSelectorTableVC.swift
//  YAGEvent
//
//  Created by Никита on 15.02.2022.
//

import UIKit

class BuildingSelectorTableVC: UITableViewController {
    var playerName = ""
    var building: [[String]] = []
    var onBuildingSelect: (([String])->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        building = Singleton.shared.buildings.filter { !(Singleton.shared.players[playerName]?.quarter.contains($0[0]) ?? true)
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return building.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "buildingCell", for: indexPath) as! BuildingTableViewCell
        let buildingMainName = building[indexPath.row]
        cell.buildingCellSet(building: buildingMainName)
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onBuildingSelect?(building[indexPath.row])
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    static func createBuildingView(name: String) -> BuildingSelectorTableVC? {
        let storyboard = UIStoryboard(name: "PlayerScreenView", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BuildingSelector") as? BuildingSelectorTableVC
        vc?.playerName = name
        return vc
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
