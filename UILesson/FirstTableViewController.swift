//
//  FirstTableViewController.swift
//  UILesson
//
//  Created by iMac200902 on 2016/10/27.
//  Copyright © 2016年 okunobu.ncp.jp. All rights reserved.
//

//iOSのライブラリをインポート
import UIKit


class FirstTableViewController : UITableViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var segGender: UISegmentedControl!
    @IBOutlet weak var swStudent: UISwitch!
    
    
    @IBOutlet weak var dispName: UILabel!
    @IBOutlet weak var dispAddress: UILabel!
    @IBOutlet weak var dispGender: UILabel!
    @IBOutlet weak var dispStudent: UILabel!
    
    
    @IBAction func changeName(sender: UITextField) {
        dispName.text = txtName.text;
    }
    
    @IBAction func changeAddress(sender: UITextField) {
        dispAddress.text = txtAddress.text;
    }
    
    
    @IBAction func changeGender(sender: UISegmentedControl) {
        dispGender.text = segGender.titleForSegmentAtIndex(segGender.selectedSegmentIndex);
    }
    
    
    @IBAction func changeStudent(sender: UISwitch) {
        if(swStudent.on == true){
            dispStudent.text = "Student";
        }
        else {
            dispStudent.text = "No Student";
        }
    }
}

