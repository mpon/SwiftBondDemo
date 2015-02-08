//
//  DemoViewController.swift
//  SwiftBondDemo
//
//  Created by Masato Oshima on 2015/02/08.
//  Copyright (c) 2015年 Masato OSHIMA. All rights reserved.
//

import UIKit
import Bond

class DemoViewController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var sliderLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITextField
        textField ->> textLabel
        
        // UISlider
        slider.map({"Hi, my value is \($0)"}) ->> sliderLabel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
