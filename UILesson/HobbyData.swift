//
//  HobbyData.swift
//  UILesson
//
//  Created by iMac200902 on 2016/11/10.
//  Copyright © 2016年 okunobu.ncp.jp. All rights reserved.
//

import Foundation

class HobbyData {
    var imgName:String;
    var name:String;
    var on:Bool;
    
    init(imgName:String, name:String, on:Bool) {
        self.imgName = imgName;
        self.name = name;
        self.on = on;
    }
    
}