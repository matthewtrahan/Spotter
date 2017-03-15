//
//  ActivityLevelViewController.swift
//  Spotter
//
//  Created by Matthew Trahan on 3/4/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import UIKit


class ActivityLevelViewController: UIViewController {

    @IBOutlet weak var notActive: UIButton!
    @IBOutlet weak var somewhatActive: UIButton!
    @IBOutlet weak var active: UIButton!
    @IBOutlet weak var extremelyActive: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonStyle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonStyle() {
        notActive.backgroundColor = .clear
        notActive.layer.cornerRadius = 5
        notActive.layer.borderWidth = 1
        notActive.layer.borderColor = UIColor.black.cgColor
        
        somewhatActive.backgroundColor = .clear
        somewhatActive.layer.cornerRadius = 5
        somewhatActive.layer.borderWidth = 1
        somewhatActive.layer.borderColor = UIColor.black.cgColor
        
        active.backgroundColor = .clear
        active.layer.cornerRadius = 5
        active.layer.borderWidth = 1
        active.layer.borderColor = UIColor.black.cgColor
        
        extremelyActive.backgroundColor = .clear
        extremelyActive.layer.cornerRadius = 5
        extremelyActive.layer.borderWidth = 1
        extremelyActive.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func notActiveSelected(_ sender: Any) {
        notActive.backgroundColor = UIColor.lightGray
        somewhatActive.backgroundColor = .clear
        active.backgroundColor = .clear
        extremelyActive.backgroundColor = .clear
        //AccountInformationViewController.activity = "notActive"
    }
    
    @IBAction func somewhatActiveSelected(_ sender: Any) {
        notActive.backgroundColor = .clear
        somewhatActive.backgroundColor = UIColor.lightGray
        active.backgroundColor = .clear
        extremelyActive.backgroundColor = .clear
        //AccountInformationViewController.activity = "somewhatActive"
    }

    @IBAction func activeSelected(_ sender: Any) {
        notActive.backgroundColor = .clear
        somewhatActive.backgroundColor = .clear
        active.backgroundColor = UIColor.lightGray
        extremelyActive.backgroundColor = .clear
        //AccountInformationViewController.activity = "active"
    }
    
    @IBAction func extremelyActiveSelected(_ sender: Any) {
        notActive.backgroundColor = .clear
        somewhatActive.backgroundColor = .clear
        active.backgroundColor = .clear
        extremelyActive.backgroundColor = UIColor.lightGray
        //AccountInformationViewController.activity = "extremelyActive"
    }
    
}
