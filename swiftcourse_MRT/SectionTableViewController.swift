//
//  SectionTableViewController.swift
//  swiftcourse_MRT
//
//  Created by TinaTien on 2016/4/30.
//  Copyright © 2016年 TinaTien. All rights reserved.
//

import UIKit


class SectionTableViewController: UITableViewController {
    
    var mrtLineSections: [Section] = SectionsData().getSectionsFromData()
    var stationLineNumberArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return mrtLineSections.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return mrtLineSections[section].stations.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mrtLineSections[section].lineSection
    }
    
    func setLineLabelColor(stationLineNumber:String) -> UIColor {
        if stationLineNumber.containsString("BR") {
            return UIColor(red: 158/255, green: 101/255, blue: 46/255, alpha: 1)
        } else if stationLineNumber.containsString("G") && !stationLineNumber.containsString("A") && !stationLineNumber.containsString("M") {
            return UIColor(red: 0/255, green: 119/255, blue: 73/255, alpha: 1)
        } else if stationLineNumber.containsString("O") {
            return UIColor(red: 255/255, green: 163/255, blue: 0/255, alpha: 1)
        } else if stationLineNumber.containsString("B") && !stationLineNumber.containsString("R") {
            return UIColor(red: 0/255, green: 94/255, blue: 184/255, alpha: 1)
        } else if stationLineNumber.containsString("R") && !stationLineNumber.containsString("B") && !stationLineNumber.containsString("A"){
            return UIColor(red: 203/255, green: 44/255, blue: 48/255, alpha: 1)
        } else if stationLineNumber.containsString("MG") {
            return UIColor(red: 119/255, green: 185/255, blue: 51/255, alpha: 1)
        } else if stationLineNumber.containsString("G03A") {
            return UIColor(red: 206/255, green: 220/255, blue: 0/255, alpha: 1)
        } else {
//            stationLineNumber.containsString("RA")
            return UIColor(red: 248/255, green: 144/255, blue: 165/255, alpha: 1)
        }

    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if mrtLineSections[indexPath.section].stationLineNo[indexPath.row].count == 1 {
            let firstCell = tableView.dequeueReusableCellWithIdentifier("OneLineCell", forIndexPath: indexPath) as! FirstSectionTableViewCell

            firstCell.nameLabel.text = mrtLineSections[indexPath.section].stations[indexPath.row] as String
            firstCell.firstLineLabel.text = mrtLineSections[indexPath.section].stationLineNo[indexPath.row][0] as String
            firstCell.firstLineLabel.backgroundColor = setLineLabelColor(mrtLineSections[indexPath.section].stationLineNo[indexPath.row][0] as String)
            firstCell.firstLineNameLabel.text = mrtLineSections[indexPath.section].stationLineName[indexPath.row][0] as String
            
            firstCell.firstLineLabel.textColor = UIColor.whiteColor()
            firstCell.firstLineLabel.layer.cornerRadius = 3
            firstCell.firstLineNameLabel.hidden = true
            
            return firstCell
            
        } else {
            
            let secondCell = tableView.dequeueReusableCellWithIdentifier("TwoLineCell", forIndexPath: indexPath) as! SecondTableViewCell

            secondCell.nameLabel.text = mrtLineSections[indexPath.section].stations[indexPath.row] as String
            secondCell.firstLineLabel.text = mrtLineSections[indexPath.section].stationLineNo[indexPath.row][0] as String
            secondCell.secondLineLabel.text = mrtLineSections[indexPath.section].stationLineNo[indexPath.row][1] as String
            secondCell.firstLineLabel.backgroundColor = setLineLabelColor(mrtLineSections[indexPath.section].stationLineNo[indexPath.row][0] as String)
            secondCell.secondLineLabel.backgroundColor = setLineLabelColor(mrtLineSections[indexPath.section].stationLineNo[indexPath.row][1] as String)
            secondCell.firstLineNameLabel.text = mrtLineSections[indexPath.section].stationLineName[indexPath.row][0] as String
            secondCell.secondLineNameLabel.text = mrtLineSections[indexPath.section].stationLineName[indexPath.row][1] as String
            
            secondCell.firstLineLabel.textColor = UIColor.whiteColor()
            secondCell.secondLineLabel.textColor = UIColor.whiteColor()

            secondCell.firstLineLabel.layer.cornerRadius = 3
            secondCell.secondLineLabel.layer.cornerRadius = 3
            
            secondCell.firstLineNameLabel.hidden = true
            secondCell.secondLineNameLabel.hidden = true
        
          return secondCell
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "showOneLine" {
                let oneLineCell = sender as! FirstSectionTableViewCell
                let destinationController = segue.destinationViewController as! OneLineViewController
                destinationController.acceptStationName = oneLineCell.nameLabel.text!
                destinationController.acceptLine = oneLineCell.firstLineNameLabel.text!
                
        } else if segue.identifier == "showTwoLine" {
            
            let twoLineCell = sender as! SecondTableViewCell
                let destinationController = segue.destinationViewController as! TwoLineViewController
            destinationController.acceptStationName = twoLineCell.nameLabel.text!
            destinationController.acceptFirstLine = twoLineCell.firstLineNameLabel.text!
            destinationController.acceptSecondLine = twoLineCell.secondLineNameLabel.text!

        }
    }
    
}
