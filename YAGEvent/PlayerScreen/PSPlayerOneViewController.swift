//
//  PSPlayerOneViewController.swift
//  123
//
//  Created by Никита on 17.12.2021.
//

import UIKit

class PSPlayerOneViewController: UIViewController {
    
    @IBOutlet weak var playerDetailsNameLabel: UILabel!
    
    @IBOutlet weak var playerDetailsImageView: UIImageView!

    @IBOutlet weak var playerDetailsStatsView: UIView!
    
    @IBOutlet weak var playerDetailsQuarterView: UIView!
    
    @IBOutlet weak var playerDetailsBagView: UIView!
    
    @IBOutlet weak var playerDetailsStatsExpTextField: UITextField!
    
    @IBOutlet weak var playerDetailsStatsInfTextField: UITextField!
    
    @IBOutlet weak var playerDetailsStatsTerTextField: UITextField!
    
    @IBOutlet weak var playerDetailsStatsCompletedTextField: UITextField!
    
    @IBOutlet weak var playerDetailsStatsDropsTextField: UITextField!
    
    @IBOutlet var quarterBuilding: [UIButton]!
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func buildingSelectorTouch(_ sender: UIButton) {
        if let vc = BuildingSelectorTableVC.createBuildingView(name: playerDetailsName) {
            func buildingSelect(buildingName: [String]) {
                sender.setTitle(buildingName[0], for: .normal)
                dataUpdate()
            }
            vc.onBuildingSelect = buildingSelect
            self.present(vc, animated: true)
        }
    }
    var playerDetailsName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        playerDetailsStatsExpTextField.delegate = self
        playerDetailsStatsInfTextField.delegate = self
        playerDetailsStatsTerTextField.delegate = self
        playerDetailsStatsCompletedTextField.delegate = self
        playerDetailsStatsDropsTextField.delegate = self
        playerDetailsNameLabel.text = playerDetailsName
        playerDetailsImageView.image = UIImage(named: "\(playerDetailsName).jpg")
        if let playerData = Singleton.shared.players[playerDetailsName] {
            playerDetailsStatsExpTextField.text = "\(playerData.expirience)"
            playerDetailsStatsInfTextField.text = "\(playerData.influence)"
            playerDetailsStatsTerTextField.text = "\(playerData.sectorsUnderControl)"
            playerDetailsStatsCompletedTextField.text = "\(playerData.completedGames)"
            playerDetailsStatsDropsTextField.text = "\(playerData.drops)"
            for i in quarterBuilding.indices {
                quarterBuilding[i].setTitle(playerData.quarter[i], for: .normal)
            }
        }
        playerDetailsStatsView.layer.cornerRadius = 20
        playerDetailsQuarterView.layer.cornerRadius = 20
        playerDetailsBagView.layer.cornerRadius = 20
    }
    
    static func createView(name: String) -> PSPlayerOneViewController? {
        let storyboard = UIStoryboard(name: "PlayerScreenView", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PlayerOneScreen") as? PSPlayerOneViewController
        vc?.playerDetailsName = name
        return vc
    }
    
    func dataUpdate() {
        var k = 0
        if let playerName = playerDetailsNameLabel.text {
            for i in quarterBuilding.indices {
            Singleton.shared.players[playerName]?.quarter[i] = quarterBuilding[i].titleLabel?.text ?? "+"
                if quarterBuilding[i].titleLabel?.text != "+" {
                    k += 1
                }
            }
            Singleton.shared.players[playerName]?.buildings = k
        }
    }
}

extension PSPlayerOneViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == playerDetailsStatsExpTextField {
            if let playerDetailsName = playerDetailsNameLabel.text {
                Singleton.shared.players[playerDetailsName]?.expirience = Int(playerDetailsStatsExpTextField.text ?? "") ?? 0
            }
        } else {
            if textField == playerDetailsStatsInfTextField {
                if let playerDetailsName = playerDetailsNameLabel.text {
                    Singleton.shared.players[playerDetailsName]?.influence = Int(playerDetailsStatsInfTextField.text ?? "") ?? 0
                }
            } else {
                if textField == playerDetailsStatsTerTextField {
                    if let playerDetailsName = playerDetailsNameLabel.text {
                        Singleton.shared.players[playerDetailsName]?.sectorsUnderControl = Int(playerDetailsStatsTerTextField.text ?? "") ?? 0
                    }
                } else {
                    if textField == playerDetailsStatsCompletedTextField {
                        if let playerDetailsName = playerDetailsNameLabel.text {
                            Singleton.shared.players[playerDetailsName]?.completedGames = Int(playerDetailsStatsCompletedTextField.text ?? "") ?? 0
                        }
                    } else {
                        if textField == playerDetailsStatsDropsTextField {
                            if let playerDetailsName = playerDetailsNameLabel.text {
                                Singleton.shared.players[playerDetailsName]?.drops = Int(playerDetailsStatsDropsTextField.text ?? "") ?? 0
                            }
                        }
                    }
                }
            }
        }
    }
}

