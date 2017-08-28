//
//  OneLineViewController.swift
//  swiftcourse_MRT
//
//  Created by TinaTien on 2016/5/4.
//  Copyright © 2016年 TinaTien. All rights reserved.
//

import UIKit

class OneLineViewController: UIViewController {

    @IBOutlet weak var stationName: UILabel!
    @IBOutlet weak var lineLabel: UILabel!
    
    var acceptStationName = String()
    var acceptLine = String()
    
    func setLineLabelColor(stationLineNumber:String) -> UIColor {
        if stationLineNumber.containsString("文湖") {
            return UIColor(red: 158/255, green: 101/255, blue: 46/255, alpha: 1)
        } else if stationLineNumber.containsString("松山新店") {
            return UIColor(red: 0/255, green: 119/255, blue: 73/255, alpha: 1)
        } else if stationLineNumber.containsString("中和新蘆") {
            return UIColor(red: 255/255, green: 163/255, blue: 0/255, alpha: 1)
        } else if stationLineNumber.containsString("板南") {
            return UIColor(red: 0/255, green: 94/255, blue: 184/255, alpha: 1)
        } else if stationLineNumber.containsString("淡水信義") {
            return UIColor(red: 203/255, green: 44/255, blue: 48/255, alpha: 1)
        } else if stationLineNumber.containsString("貓空") {
            return UIColor(red: 119/255, green: 185/255, blue: 51/255, alpha: 1)
        } else if stationLineNumber.containsString("小碧潭") {
            return UIColor(red: 206/255, green: 220/255, blue: 0/255, alpha: 1)
        } else {
            return UIColor(red: 248/255, green: 144/255, blue: 165/255, alpha: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stationName.text = acceptStationName
        self.lineLabel.text = acceptLine
        
        self.lineLabel.textColor = UIColor.whiteColor()
        
        self.lineLabel.backgroundColor = setLineLabelColor(acceptLine)
        
        self.navigationItem.title = acceptStationName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
    }
    



}
