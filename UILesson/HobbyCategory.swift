//
//  HobbyCategory.swift
//  UILesson
//
//  Created by iMac200902 on 2016/11/10.
//  Copyright © 2016年 okunobu.ncp.jp. All rights reserved.
//

import Foundation

class HobbyCategory {
    var name:String;
    var hobbyList:[HobbyData];
    
    init(name:String, hobbyList:[HobbyData]) {
        self.name = name;
        self.hobbyList = hobbyList;
    }
}