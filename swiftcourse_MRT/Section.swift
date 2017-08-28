//
//  Section.swift
//  swiftcourse_MRT
//
//  Created by TinaTien on 2016/4/30.
//  Copyright © 2016年 TinaTien. All rights reserved.
//

import Foundation

struct Section {

    var lineSection : String
    var stations : [String]
    var stationLineNo : [[String]]
    var stationLineName : [[String]]
    
    init(title: String, objects : [String], no: [[String]], line: [[String]]) {
        
        lineSection = title
        stations = objects
        stationLineNo = no
        stationLineName = line
    }
    
    
  
    
}