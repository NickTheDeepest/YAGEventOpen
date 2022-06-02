//
//  PlayerScreenViewController.swift
//  YAGEvent
//
//  Created by Никита on 11.01.2022.
//

import UIKit

class PlayerScreenViewController: UIViewController {

    @IBOutlet var playerProfileTableView: UITableView!
    
    var playerNames = ["DeadLite", "Blame", "Number5", "Vizo", "Zoidberg"]
    
    let cellSpacingHeights : CGFloat = 3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerProfileTableView.delegate = self
        playerProfileTableView.dataSource = self
        // Do any additional setup after loading the view.
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

extension PlayerScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerName = playerNames[indexPath.section]
        if let vc = PSPlayerOneViewController.createView(name: playerName) {
        self.present(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeights
    }
}

extension PlayerScreenViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return playerNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cellPlayer = tableView.dequeueReusableCell(withIdentifier: "cellPlayer", for: indexPath) as! TableViewPlayerCell
        let playerName = playerNames[indexPath.section]
        cellPlayer.playerCellSet(playerName: playerName)
        return cellPlayer
    }
}
