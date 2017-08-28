//
//  SectionsData.swift
//  swiftcourse_MRT
//
//  Created by TinaTien on 2016/4/30.
//  Copyright © 2016年 TinaTien. All rights reserved.
//

import Foundation
import SwiftyJSON


class  SectionsData {
    
    func getSectionsFromData() -> [Section] {
        
        let path = NSBundle.mainBundle().pathForResource("MRT", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let json = JSON(data: data!)
        
        var wenhuArray = [String]()
        var tanshuiShinyiArray = [String]()
        var newBeitouArray = [String]()
        var songshanShindianArray = [String]()
        var smallBitanArray = [String]()
        var zhongheShinluArray = [String]()
        var bannanArray = [String]()
        var maoukongArray = [String]()
        
        var wenhuArrayNo = [[String]]()
        var tanshuiShinyiArrayNo = [[String]]()
        var newBeitouArrayNo = [[String]]()
        var songshanShindianArrayNo = [[String]]()
        var smallBitanArrayNo = [[String]]()
        var zhongheShinluArrayNo = [[String]]()
        var bannanArrayNo = [[String]]()
        var maoukongArrayNo = [[String]]()
        
        var wenhuArrayName = [[String]]()
        var tanshuiShinyiArrayName = [[String]]()
        var newBeitouArrayName = [[String]]()
        var songshanShindianArrayName = [[String]]()
        var smallBitanArrayName = [[String]]()
        var zhongheShinluArrayName = [[String]]()
        var bannanArrayName = [[String]]()
        var maoukongArrayName = [[String]]()
        
        for i in 0...json.count {
            let name = json[i]["name"].stringValue
            let linesName = json[i]["lines"].map({ (x:(String, JSON)) -> String in
                x.0
            })
            let linesNumber = json[i]["lines"].map({ (x:(String, JSON)) -> String in
                x.1.stringValue
            })

            if linesName.contains("文湖線") {
                wenhuArray.append(name)
                wenhuArrayNo.append(linesNumber)
                wenhuArrayName.append(linesName)
            }
            
            if linesName.contains("淡水信義線") {
                tanshuiShinyiArray.append(name)
                tanshuiShinyiArrayNo.append(linesNumber)
                tanshuiShinyiArrayName.append(linesName)
            }
            
            if linesName.contains("新北投支線") {
                newBeitouArray.append(name)
                newBeitouArrayNo.append(linesNumber)
                newBeitouArrayName.append(linesName)
            }
            
            if linesName.contains("松山新店線") {
                songshanShindianArray.append(name)
                songshanShindianArrayNo.append(linesNumber)
                songshanShindianArrayName.append(linesName)
            }

            if linesName.contains("小碧潭支線") {
                smallBitanArray.append(name)
                smallBitanArrayNo.append(linesNumber)
                smallBitanArrayName.append(linesName)

            }
            
            if linesName.contains("中和新蘆線") {
                zhongheShinluArray.append(name)
                zhongheShinluArrayNo.append(linesNumber)
                zhongheShinluArrayName.append(linesName)
            }
            
            if linesName.contains("板南線") {
                bannanArray.append(name)
                bannanArrayNo.append(linesNumber)
                bannanArrayName.append(linesName)
            }
            
            if linesName.contains("貓空纜車") {
                maoukongArray.append(name)
                maoukongArrayNo.append(linesNumber)
                maoukongArrayName.append(linesName)
            }
        
        }
        
        var sectionsArray = [Section]()
        
        let wenhuLine = Section(title: "文湖線", objects: wenhuArray, no: wenhuArrayNo, line: wenhuArrayName)
        let tanshuiShinyiLine = Section(title: "淡水信義線", objects: tanshuiShinyiArray, no: tanshuiShinyiArrayNo, line: tanshuiShinyiArrayName)
        let newBeitouLine = Section(title: "新北投支線", objects: newBeitouArray, no: newBeitouArrayNo, line: newBeitouArrayName)
        let songshanShindianLine = Section(title: "松山新店線", objects: songshanShindianArray, no: songshanShindianArrayNo, line: songshanShindianArrayName)
        let smallBitanLine = Section(title: "小碧潭支線", objects: smallBitanArray, no: smallBitanArrayNo, line: smallBitanArrayName )
        let zhongheShinluLine = Section(title: "中和新蘆線", objects: zhongheShinluArray, no: zhongheShinluArrayNo, line: zhongheShinluArrayName )
        let bannanLine = Section(title: "板南線", objects: bannanArray, no: bannanArrayNo, line: bannanArrayName)
        let maoukongLine = Section(title: "貓空纜車", objects: maoukongArray, no: maoukongArrayNo, line: maoukongArrayName)
        
        sectionsArray.append(wenhuLine)
        sectionsArray.append(tanshuiShinyiLine)
        sectionsArray.append(newBeitouLine)
        sectionsArray.append(songshanShindianLine)
        sectionsArray.append(smallBitanLine)
        sectionsArray.append(zhongheShinluLine)
        sectionsArray.append(bannanLine)
        sectionsArray.append(maoukongLine)

        return sectionsArray
        
 
    }
    
   


}
    